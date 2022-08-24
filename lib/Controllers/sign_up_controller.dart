import 'dart:convert';
import 'dart:io';

import 'package:assement/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../Models/DataModels/User.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/ParamsModels/LoginApiModel.dart';
import '../Utils/device_info.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import '../Views/home_tab.dart';
import 'alert_managar_controller.dart';

class SignUpController extends GetxController {
  SignUpType type;

  SignUpController({required this.type});

  RxBool isLoding = RxBool(false);
  RxBool isEnable = RxBool(false);
  String _deviceId = '';
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchDeviceID();
  }

  void _fetchDeviceID() async {
    _deviceId = await DeviceInfo.getDeviceId() ?? '';
  }

  void validation() async {
    if (GetUtils.isLengthLessOrEqual(firstName.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid FirstName', 'Please enter first name.', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(lastName.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid lastName', 'Please enter last name.', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(email.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter email.', Position.bottom);
    } else if (!GetUtils.isEmail(email.value)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter vaild email', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(password.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Password', 'Please enter password', Position.bottom);
    } else if (GetUtils.isLengthLessThan(password.value, 6)) {
      AlertManagerController.showSnackBar('invalid password length',
          'Password must contains at least 6 characters.', Position.bottom);
    } else {
      final registerApiModel = RegisterAPIModel(
          deviceType: Platform.isIOS ? 'ios' : 'android',
          deviceId: _deviceId,
          deviceToken: '5s4dsa54d6a4d',
          firstName: firstName.value,
          lastName: lastName.value,
          email: email.value,
          password: password.value,
          signUpType: 1);
      final params = registerApiModel.toJson();
      _apiCall(params);
    }
  }

  void loginValidation() async {
    if (GetUtils.isLengthLessOrEqual(email.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter email', Position.bottom);
    } else if (!GetUtils.isEmail(email.value)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter vaild email', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(password.value, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Password', 'Please enter password', Position.bottom);
    } else if (GetUtils.isLengthLessThan(password.value, 6)) {
      AlertManagerController.showSnackBar('invalid password length',
          'Password must contains at least 6 characters.', Position.bottom);
    } else {
      final loginAPIModel = LoginApiModel(
          email: email.value,
          password: password.value,
          deviceId: _deviceId,
          deviceToken: '5s4dsa54d6a4d',
          deviceType: Platform.isIOS ? 'ios' : 'android');
      final params = loginAPIModel.toJson();

      _apiCall(params);
    }
  }

  void shoudldButtonEnable() {
    if (type == SignUpType.signIn) {
      isEnable.value = email.value.isNotEmpty && password.value.isNotEmpty;
    } else {
      isEnable.value = firstName.value.isNotEmpty &&
          lastName.value.isNotEmpty &&
          email.value.isNotEmpty &&
          password.value.isNotEmpty;
    }
    update();
  }

  void _apiCall(Map<String, dynamic> params) async {
    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel<UserData> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: type.path, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      await sharedUser
          .updateValue(responseModel.data?.toJson() ?? <String, dynamic>{});
      await AppUser.saveIsLoginVerfied();
      Get.offAll(() => HomeTab());
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}

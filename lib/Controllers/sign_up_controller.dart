import 'dart:convert';
import 'dart:io';

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
  RxBool isLoding = RxBool(false);
  String _deviceId = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fetchDeviceID();
  }

  void _fetchDeviceID() async {
    _deviceId = await DeviceInfo.getDeviceId() ?? '';
  }

  void validation(
      String firstName, String lastName, String email, String password) async {
    if (GetUtils.isLengthLessOrEqual(firstName, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid FirstName', 'Please enter first name.', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(lastName, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid lastName', 'Please enter last name.', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(email, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter email.', Position.bottom);
    } else if (!GetUtils.isEmail(email)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter vaild email', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(password, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Password', 'Please enter password', Position.bottom);
    } else if (GetUtils.isLengthLessThan(password, 6)) {
      AlertManagerController.showSnackBar('invalid password length',
          'Password must contains at least 6 characters.', Position.bottom);
    } else {
      isLoding.value = true;
      final registerApiModel = RegisterAPIModel(
          email: email,
          password: password,
          deviceType: Platform.isIOS ? 'ios' : 'android',
          deviceId: _deviceId,
          deviceToken: '5s4dsa54d6a4d',
          firstName: firstName,
          lastName: lastName,
          signUpType: 1);
      final params = registerApiModel.toJson();
      ResponseModel<UserData> responseModel = await sharedServiceManager
          .createPostRequest(typeOfEndPoint: APIType.signUp, params: params);
      isLoding.value = false;

      if (responseModel.status == APIConstant.statusCodeSuccess) {
        await sharedUser
            .updateValue(responseModel.data?.toJson() ?? <String, dynamic>{});
        await AppUser.saveIsLoginVerfied();
        Get.offAll(const HomeTab());
      } else {
        AlertManagerController.showSnackBar(
            '', responseModel.message, Position.bottom);
      }
    }
  }

  void loginValidation(String email, String password) async {
    if (GetUtils.isLengthLessOrEqual(email, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter email', Position.bottom);
    } else if (!GetUtils.isEmail(email)) {
      AlertManagerController.showSnackBar(
          'Invalid email', 'Please enter vaild email', Position.bottom);
    } else if (GetUtils.isLengthLessOrEqual(password, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Password', 'Please enter password', Position.bottom);
    } else if (GetUtils.isLengthLessThan(password, 6)) {
      AlertManagerController.showSnackBar('invalid password length',
          'Password must contains at least 6 characters.', Position.bottom);
    } else {
      final loginAPIModel = LoginApiModel(
          email: email,
          password: password,
          deviceId: _deviceId,
          deviceToken: '5s4dsa54d6a4d',
          deviceType: Platform.isIOS ? 'ios' : 'android');
      final params = loginAPIModel.toJson();
      AlertManagerController.showLoaderDialog(Get.context!);
      ResponseModel<UserData> responseModel = await sharedServiceManager
          .createPostRequest(typeOfEndPoint: APIType.login, params: params);
      AlertManagerController.hideLoaderDialog();

      if (responseModel.status == APIConstant.statusCodeSuccess) {
        await sharedUser
            .updateValue(responseModel.data?.toJson() ?? <String, dynamic>{});
        await AppUser.saveIsLoginVerfied();
        Get.offAll(const HomeTab());
      } else {
        AlertManagerController.showSnackBar(
            '', responseModel.message, Position.bottom);
      }
    }
  }
}

import 'dart:io';

import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:get/get.dart';

import '../Models/DataModels/User.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/ParamsModels/LoginApiModel.dart';
import '../Utils/device_info.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import 'alert_managar_controller.dart';

class LoginController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = RxBool(false);
  RxBool isEnable = RxBool(false);
  String _deviceId = '';

  @override
  void onInit() {
    super.onInit();
    _fetchDeviceID();
  }

  void _fetchDeviceID() async {
    _deviceId = await DeviceInfo.getDeviceId() ?? '';
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
      isLoading.value = true;
      _apiCall(params);
      isLoading.value = false;
    }
  }

  void shoudldButtonEnable() {
    isEnable.value = email.value.isNotEmpty && password.value.isNotEmpty;
    update();
  }

  void _apiCall(Map<String, dynamic> params) async {
    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel<UserData> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.login, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      await sharedUser
          .updateValue(responseModel.data?.toJson() ?? <String, dynamic>{});
      await AppUser.saveIsLoginVerfied();
      Get.offAllNamed(ScreenRoutesConstant.homeTab);
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}

import 'package:assement/Utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/raffale_list.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/DataModels/user_reviews.dart';
import '../Models/ParamsModels/user_raffle_api_model.dart';
import '../Utils/device_info.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import '../Views/welcome.dart';
import 'SharedManager.dart';
import 'alert_managar_controller.dart';

class ProfileController extends GetxController {
  int offset;
  int limit;
  UserType userType = UserType.current;
  RxInt selectedIndex = 0.obs;
  RxInt groupValue = 0.obs;
  SingleUser user = sharedUser.user;
  RxList<Raffale> userRaffleList = <Raffale>[].obs;
  RxList<ReviewList> userReviewList = <ReviewList>[].obs;
  String _deviceId = '';
  int id = 0;

  Rxn<SingleUser>? currentUser = Rxn(null);

  ProfileController(
      {required this.offset,
      required this.limit,
      required this.id,
      required this.userType});

  @override
  void onInit() {
    super.onInit();
    _fetchDeviceID();
  }

  void _fetchDeviceID() async {
    _deviceId = await DeviceInfo.getDeviceId() ?? '';
  }

  void _callAPI() {
    fetchRaffleList();
    fetchReviewList();
  }

  fetchRaffleList() async {
    if (currentUser?.value == null) return;

    final userRaffleAPIModel = UserAPIModel(
        limit: limit,
        offset: offset,
        createdAt: '',
        userId: currentUser?.value?.id ?? 0,
        forUser: 0,
        status: 0);
    final params = userRaffleAPIModel.toJson();

    ResponseModel<RaffaleList> responseModel =
        await sharedServiceManager.createPostRequest(
            typeOfEndPoint: APIType.raffaleUserList, params: params);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      final userRaffleResponse = responseModel.data;
      if (userRaffleResponse != null) {
        userRaffleList.value = userRaffleResponse.data ?? [];
      } else {
        AlertManagerController.showSnackBar(
            '', responseModel.message, Position.bottom);
      }
    }
  }

  fetchReviewList() async {
    if (currentUser?.value == null) return;

    final userRaffleAPIModel = UserAPIModel(
        limit: limit,
        offset: offset,
        userId: currentUser?.value?.id ?? 0,
        createdAt: '',
        status: 0,
        forUser: 0);
    final params = userRaffleAPIModel.toJson();

    ResponseModel<UserReviewData> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.review, params: params);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      if (responseModel.data != null) {
        final userReview = responseModel.data;
        userReviewList.value = userReview?.data ?? [];
      } else {
        AlertManagerController.showSnackBar(
            '', responseModel.message, Position.bottom);
      }
    }
  }

  void logout() async {
    Map<String, dynamic> params = {};

    if (_deviceId.isNotEmpty) {
      params['device_id'] = _deviceId;
    }

    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel<void> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.logout, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      AppUser.clearPreferences();
      Get.offAll(() => WelComeView());
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void getUserProfile() async {
    ResponseModel<SingleUser> responseModel;

    if (userType == UserType.current) {
      responseModel = await sharedServiceManager.createGetRequest(
          typeOfEndPoint: userType.apiType);
    } else {
      if (id == 0) return;
      Map<String, dynamic> params = {};
      params['user_id'] = id;
      responseModel = await sharedServiceManager.createPostRequest(
          typeOfEndPoint: userType.apiType, params: params);
    }

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      currentUser?.value = responseModel.data;
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }

    if (userType == UserType.other) {
      await fetchRaffleList();
      await fetchReviewList();
    }
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeGroupIndex(int index) {
    groupValue.value = index;
  }
}

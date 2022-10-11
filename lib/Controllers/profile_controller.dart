import 'dart:ffi';

import 'package:assement/Models/user_address.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuple/tuple.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/product_detail_models.dart';
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
import 'package:geocoding/geocoding.dart';

class ProfileController extends GetxController {
  int offset;
  int limit;
  UserType userType = UserType.current;
  RxInt selectedIndex = 0.obs;
  RxInt groupValue = 0.obs;
  Rx<SingleUser> user = Rx(sharedUser.user);
  RxList<Raffale> userRaffleList = <Raffale>[].obs;
  RxList<ReviewList> userReviewList = <ReviewList>[].obs;
  String _deviceId = '';
  int id = 0;
  Rx<LatLng> latLng = Rx(LatLng(21.6356704, 69.5967292));
  RxString city = ''.obs;
  TextEditingController textEditingController = TextEditingController();
  RxString text = ''.obs;
  RxString confirm = ''.obs;

  Rxn<LocAddress> address = Rxn(null);

  RxSet<Marker> markers = RxSet();

  ProfileController(
      {required this.offset,
      required this.limit,
      required this.id,
      required this.userType});

  @override
  void onInit() {
    super.onInit();
    _fetchDeviceID();
    // getAddress();
  }

  void _fetchDeviceID() async {
    _deviceId = await DeviceInfo.getDeviceId() ?? '';
  }

  void _callAPI() {
    fetchRaffleList();
    fetchReviewList();
  }

  void setup(EditFieds fieds) {
    switch (fieds) {
      case EditFieds.name:
        text.value = user.value.fullName;
        break;
      case EditFieds.email:
        text.value = user.value.email;
        break;
      case EditFieds.changePassword:
        break;
    }
    textEditingController.text = text.value;
  }

  bool validate(EditFieds fieds) {
    switch (fieds) {
      case EditFieds.name:
        if (GetUtils.isLengthLessOrEqual(text.value, 0)) {
          AlertManagerController.showSnackBar(
              '', 'Please enter name', Position.bottom);
          return false;
        } else {
          print(text.value);
          return true;
        }
        break;
      case EditFieds.email:
        if (GetUtils.isLengthLessOrEqual(text.value, 0)) {
          AlertManagerController.showSnackBar(
              '', 'Please enter email', Position.bottom);
          return false;
        } else if (!GetUtils.isEmail(text.value)) {
          AlertManagerController.showSnackBar(
              '', 'Please enter valid email', Position.bottom);
          return false;
        } else {
          return true;
        }

      case EditFieds.changePassword:
        break;
    }
    print(text.value);
    return true;
  }

  fetchRaffleList() async {
    final userRaffleAPIModel = UserAPIModel(
        limit: limit,
        offset: offset,
        createdAt: '',
        userId: user.value.id,
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
    // if (currentUser?.value == null) return;

    final userRaffleAPIModel = UserAPIModel(
        limit: limit,
        offset: offset,
        userId: user.value.id,
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

  Future<void> getAddress() async {
    ResponseModel<LocAddress> responseModel = await sharedServiceManager
        .createGetRequest(typeOfEndPoint: APIType.getAddress);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      print(responseModel);
      address.value = responseModel.data;
      LatLng newLatlng = LatLng(
          double.parse(responseModel.data?.latitude ?? ''),
          double.parse(responseModel.data?.longitude ?? ''));
      latLng.value = newLatlng;
      setupMarker();
      getCityName();
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void updateLatLng(LatLng newLatlng) {
    latLng.value = newLatlng;
  }

  void setupMarker() {
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId('marker'), onTap: () {}, position: latLng.value));
  }

  void getCityName() async {
    List<Placemark> address = await placemarkFromCoordinates(
        latLng.value.latitude, latLng.value.longitude);
    city.value = address.first.name ?? '';
    print(address.first.name);
  }

  Future<bool> updateAddress(BuildContext context) async {
    Map<String, dynamic> params = {};

    if (address.value?.fullName != null) {
      params['full_name'] = address.value?.fullName;
    }

    if (address.value?.street1 != null) {
      params['street_1'] = address.value?.street1;
    }

    if (address.value?.street2 != null) {
      params['street_2'] = address.value?.street2;
    }

    if (city.value.isNotEmpty) {
      params['city'] = city.value;
    }

    if (address.value?.state != null) {
      params['state'] = address.value?.state;
    }

    if (address.value?.zipCode != null) {
      params['zip_code'] = address.value?.zipCode;
    }

    if (address.value?.billingFullName != null) {
      params['billing_full_name'] = address.value?.billingFullName;
    }

    if (address.value?.billingStreet1 != null) {
      params['billing_street_1'] = address.value?.billingStreet1;
    }

    if (address.value?.billingStreet2 != null) {
      params['billing_street_2'] = address.value?.billingStreet2;
    }

    if (address.value?.billingCity != null) {
      params['billing_city'] = address.value?.billingCity;
    }

    if (address.value?.billingState != null) {
      params['billing_state'] = address.value?.billingState;
    }

    if (address.value?.billingZipCode != null) {
      params['billing_zip_code'] = address.value?.billingZipCode;
    }

    params['latitude'] = latLng.value.latitude;
    params['longitude'] = latLng.value.longitude;

    AlertManagerController.showLoaderDialog(Get.context!);

    ResponseModel<void> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.addAddress, params: params);

    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      print(responseModel);
      return true;
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
      return false;
    }
  }

  void logout() async {
    Map<String, dynamic> params = {};

    if (_deviceId.isNotEmpty) {
      params['device_id'] = _deviceId;
    } else {
      return;
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
      user.value = responseModel.data!;
      _callAPI();
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeGroupIndex(int index) {
    groupValue.value = index;
  }

  Tuple2<String, String> getFirstAndLastName(EditFieds fieds) {
    if (fieds == EditFieds.name) {
      List<String> values = text.split(' ');
      return Tuple2(values.first, values.last);
    } else {
      return Tuple2('', '');
    }
  }

  Future<bool> updateProfile(EditFieds fieds) async {
    Tuple2 firstAndLastName = getFirstAndLastName(fieds);

    Map<String, dynamic> params = {};
    if (fieds == EditFieds.name) {
      params['first_name'] = firstAndLastName.item1;
      params['last_name'] = firstAndLastName.item2;
    } else if (fieds == EditFieds.email) {
      params['email'] = text.value;
    }

    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel<SingleUser> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.updateUser, params: params);
    AlertManagerController.hideLoaderDialog();

    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      user.value = responseModel.data!;
      return true;
    } else {
      return false;
    }
  }
}

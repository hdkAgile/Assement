import 'dart:html';

import 'package:assement/Models/DataModels/app_user.dart';
import 'package:assement/Models/DataModels/tickets_purchase_list.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Models/DataModels/User.dart';
import '../Models/DataModels/raffale_list.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/ParamsModels/header_api_model.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import 'SharedManager.dart';
import 'alert_managar_controller.dart';

class FavoriteController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt groupValue = 0.obs;
  RxList<Raffale> items = <Raffale>[].obs;
  RxList<Raffale> purchaseList = <Raffale>[].obs;
  RxBool isLoading = RxBool(false);
  SingleUser user = sharedUser.user;

  RxString dropDownValue = 'Active'.obs;

  RxList<String> dropDownItems = ['Active', 'In Active'].obs;

  @override
  void onInit() {
    super.onInit();
    _callAPI();
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeGroupIndex(int index) {
    groupValue.value = index;
    _callAPI();
  }

  void _callAPI() async {
    switch (groupValue.value) {
      case 0:
        await fetchPurchaseTikcets();
        break;
      case 1:
        await fetchFavouriteList();
        break;
      case 2:
        break;
      default:
        break;
    }
  }

  Future<void> fetchFavouriteList() async {
    Map<String, dynamic> params = {};
    params["limit"] = 10;
    params["offset"] = 0;

    isLoading.value = true;
    ResponseModel<RaffaleList> responseModel =
        await sharedServiceManager.createPostRequest(
            typeOfEndPoint: APIType.favouriteList, params: params);
    isLoading.value = false;
    if (responseModel.status == APIConstant.statusCodeSuccess) {
      final raffleData = responseModel.data;
      if (raffleData != null) {
        items.value = raffleData.data ?? [];
      }
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  Future<bool> favouriteUnfavouriteRaffale(
      {required int id,
      required RaffleFavourite raffleFavourite,
      required BuildContext context}) async {
    Map<String, dynamic> params = {};
    params['raffle_id'] = id;
    params['is_favourite'] = raffleFavourite.value;

    AlertManagerController.showLoaderDialog(Get.context!);

    ResponseModel responseModel = await sharedServiceManager.createPostRequest(
        typeOfEndPoint: APIType.favourite, params: params);

    AlertManagerController.hideLoaderDialog();

    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      fetchFavouriteList();
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchPurchaseTikcets() async {
    Map<String, dynamic> params = {};
    params['offset'] = 0;
    params['limit'] = 10;

    isLoading.value = true;
    ResponseModel<RaffaleList> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.ticketList, params: params);
    isLoading.value = false;

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      purchaseList.value = responseModel.data?.data ?? [];
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}

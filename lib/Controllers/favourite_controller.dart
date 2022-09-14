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
  RxBool isLoading = RxBool(false);
  UserData? userData;

  RxString dropDownValue = 'Active'.obs;

  RxList<String> dropDownItems = ['Active', 'In Active'].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavouriteList();
  }

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void changeGroupIndex(int index) {
    groupValue.value = index;
  }

  void fetchFavouriteList() async {
    final user = SharedManager.shared.fetchUser();
    userData = user;
    Map<String, dynamic> params = {};
    params["limit"] = 0;
    params["offset"] = 10;

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

  void favouriteUnfavouriteRaffale(
      {required int id,
      required RaffleFavourite raffleFavourite,
      required BuildContext context}) async {
    Map<String, dynamic> params = {};
    params['raffle_id'] = id;
    params['is_favourite'] = raffleFavourite.value;

    ResponseModel responseModel = await sharedServiceManager.createPostRequest(
        typeOfEndPoint: APIType.favourite, params: params);

    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);
    if (responseModel.status == APIConstant.statusCodeSuccess) {
      fetchFavouriteList();
    }
  }
}

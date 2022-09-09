import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/DataModels/card.dart';
import '../Models/DataModels/response_model.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import 'alert_managar_controller.dart';

class CardController extends GetxController {
  RxList<Cards> cards = <Cards>[].obs;
  RxString fullName = ''.obs;
  RxString cardNumber = ''.obs;
  RxString month = ''.obs;
  RxString year = ''.obs;
  RxString cvv = ''.obs;

  RxBool isAllVaildEntries = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    getCardList();
  }

  void getCardList() async {
    ResponseModel<List<Cards>> responseModel = await sharedServiceManager
        .createGetRequest(typeOfEndPoint: APIType.getCardList);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      cards.value = responseModel.data ?? [];
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void deleteCard(int index, BuildContext context) async {
    Map<String, dynamic> params = {};
    Cards selectedCard = cards[index];
    if (selectedCard.id != null) {
      params['card_id'] = selectedCard.id;
    }
    AlertManagerController.showLoaderDialog(context);
    ResponseModel responseModel = await sharedServiceManager.createPostRequest(
        typeOfEndPoint: APIType.deleteCard, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      getCardList();
      cards.refresh();
    }
    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);
  }

  String get finalCardNumber {
    List<String> newCardNumber = cardNumber.value.split(" ");
    newCardNumber.removeWhere((element) => element == null);

    return newCardNumber.join('');
  }

  void addCard() async {
    Map<String, dynamic> params = {};

    params['number'] = finalCardNumber;
    params['exp_month'] = month.value;
    params['exp_year'] = year.value;
    params['cvc'] = cvv.value;
    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel<Cards> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.addCard, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      print(responseModel.data);
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void checkValidation() {
    if (GetUtils.isLengthLessOrEqual(fullName.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(cardNumber.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(cvv.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(month.value, 0) &&
        (GetUtils.isLengthLessOrEqual(year.value, 0))) {
      isAllVaildEntries.value = false;
    } else {
      isAllVaildEntries.value = true;
    }
  }
}

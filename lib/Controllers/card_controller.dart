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

  Cards? selectedDefaultCard;

  RxBool isAllVaildEntries = RxBool(false);

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthAndYearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void getCardList(BuildContext context, bool showLoader) async {
    if (showLoader) AlertManagerController.showLoaderDialog(context);

    ResponseModel<List<Cards>> responseModel = await sharedServiceManager
        .createGetRequest(typeOfEndPoint: APIType.getCardList);

    if (showLoader) AlertManagerController.hideLoaderDialog();

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
      cards.removeAt(index);
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

  String get monthAndYear {
    List<String> items = [
      selectedDefaultCard?.expMonth?.toString() ?? '',
      selectedDefaultCard?.expYear?.toString() ?? ''
    ];
    items.removeWhere((element) => element == null);

    return items.join('/');
  }

  Future<bool> addCard() async {
    Map<String, dynamic> params = {};

    params['number'] = finalCardNumber;
    params['exp_month'] = month.value;
    params['exp_year'] = year.value;
    params['cvc'] = cvv.value;

    AlertManagerController.showLoaderDialog(Get.context!);

    ResponseModel<Cards> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.addCard, params: params);
    AlertManagerController.hideLoaderDialog();
    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateDefaultCard(int index, BuildContext context) async {
    Map<String, dynamic> params = {};

    params['card_id'] = cards.value[index].id;

    AlertManagerController.showLoaderDialog(context);
    ResponseModel<Cards> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.updateCard, params: params);
    AlertManagerController.hideLoaderDialog();

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      selectedDefaultCard = responseModel.data;
      setupSelectedCard();
      return true;
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
      return false;
    }
  }

  void checkValidation() {
    if (GetUtils.isLengthLessOrEqual(fullName.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(cardNumber.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthEqualTo(cardNumber.value.length, 16)) {
      isAllVaildEntries.value = true;
    } else if (GetUtils.isLengthLessOrEqual(cvv.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthEqualTo(cvv.value.length, 3)) {
      isAllVaildEntries.value = true;
    } else if (GetUtils.isLengthLessOrEqual(month.value, 0) &&
        (GetUtils.isLengthLessOrEqual(year.value, 0))) {
      isAllVaildEntries.value = false;
    } else {
      isAllVaildEntries.value = true;
    }
  }

  void setupSelectedCard() {
    cardNumberController.text = '.... ${selectedDefaultCard?.last4 ?? ''}';
    monthAndYearController.text = monthAndYear;
    cvvController.text = selectedDefaultCard?.name ?? '';
  }
}

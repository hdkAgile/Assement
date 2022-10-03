import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Controllers/product_detail_controller.dart';
import 'package:assement/Models/DataModels/product_detail_models.dart';
import 'package:assement/Models/DataModels/response_model.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Utils/network_manager/remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/DataModels/card.dart';

class CheckOutController extends GetxController {
  RxInt totalTickets = 1.obs;
  int ticketPrice = 5;
  RxInt total = 5.obs;
  ProductDetailData productDetailData = ProductDetailData();
  RxString fullName = ''.obs;
  RxString cardNumber = ''.obs;
  RxString street = ''.obs;
  RxString anotherStreet = ''.obs;
  RxString city = ''.obs;
  RxString state = ''.obs;
  RxString zipCode = ''.obs;

  RxString billingFullName = ''.obs;
  RxString billingCardNumber = ''.obs;
  RxString billingStreet = ''.obs;
  RxString billingAnotherStreet = ''.obs;
  RxString billingcity = ''.obs;
  RxString billingState = ''.obs;
  RxString billingZipCode = ''.obs;

  RxBool isAllVaildEntries = RxBool(false);
  RxBool isSameAsShippingAddress = RxBool(false);

  TextEditingController nameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController anotherStreeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  String cardId = '';

  @override
  void onInit() {
    super.onInit();
    _setupProductDetail();
  }

  int get availableTikcets {
    if (productDetailData == null) return 0;

    if (productDetailData.quantity != null &&
        productDetailData.soldTicket != null) {
      return productDetailData.quantity! - productDetailData.soldTicket!;
    }
    return 0;
  }

  void _setupProductDetail() {
    productDetailData =
        Get.find<ProductDetailController>().productDetailData.value;
    ticketPrice = int.parse(productDetailData.ticketPrice ?? '');

    _calculateTotal();
  }

  void increaseTotalTickets() {
    if (totalTickets.value > availableTikcets) {
      AlertManagerController.showSnackBar('', 'Limit exceed', Position.bottom);
      return;
    } else {
      totalTickets.value++;
      _calculateTotal();
    }
  }

  void decreseTotalTickets() {
    totalTickets.value--;
    if (totalTickets.value < 1) {
      totalTickets.value = 1;
    } else {}
    _calculateTotal();
  }

  void _calculateTotal() {
    total.value = totalTickets.value * ticketPrice;
  }

  void setupBillingAddress() {
    nameController.text =
        isSameAsShippingAddress.value ? fullName.value : billingFullName.value;
    streetController.text =
        isSameAsShippingAddress.value ? street.value : billingStreet.value;
    anotherStreeController.text = isSameAsShippingAddress.value
        ? anotherStreet.value
        : billingAnotherStreet.value;
    cityController.text =
        isSameAsShippingAddress.value ? city.value : billingcity.value;
    stateController.text =
        isSameAsShippingAddress.value ? state.value : billingState.value;
    zipCodeController.text =
        isSameAsShippingAddress.value ? zipCode.value : billingZipCode.value;
  }

  void checkValidation() {
    if (GetUtils.isLengthLessOrEqual(fullName.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(street.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(anotherStreet.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(city.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(state.value, 0)) {
      isAllVaildEntries.value = false;
    } else if (GetUtils.isLengthLessOrEqual(zipCode.value, 0)) {
      isAllVaildEntries.value = false;
    } else {
      isAllVaildEntries.value = true;
    }
  }

  Future<bool> checkOut() async {
    Map<String, dynamic> params = {};

    if (productDetailData.id != null) {
      params['raffle_id'] = productDetailData.id;
    }
    params['quantity'] = totalTickets.value;
    params['paymet_method'] = 'card';

    params['full_name'] = fullName.value;
    params['street_1'] = street.value;
    params['street_2'] = anotherStreet.value;
    params['city'] = city.value;
    params['state'] = state.value;
    params['zip_code'] = zipCode.value;

    params['billing_full_name'] = nameController.text;
    params['billing_street_1'] = streetController.text;
    params['billing_street_2'] = anotherStreeController.text;
    params['billing_city'] = cityController.text;
    params['billing_state'] = stateController.text;
    params['billing_zip_code'] = zipCodeController.text;

    params['card_id'] = cardId;

    AlertManagerController.showLoaderDialog(Get.context!);

    ResponseModel responseModel = await sharedServiceManager.createPostRequest(
        typeOfEndPoint: APIType.checkout, params: params);

    AlertManagerController.hideLoaderDialog();

    print(responseModel.status);
    print(responseModel.message);

    AlertManagerController.showSnackBar(
        '', responseModel.message, Position.bottom);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      return true;
    } else {
      return false;
    }
  }
}

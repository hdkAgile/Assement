import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Controllers/product_detail_controller.dart';
import 'package:assement/Models/DataModels/product_detail_models.dart';
import 'package:assement/Models/DataModels/response_model.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Utils/network_manager/remote_services.dart';
import 'package:get/get.dart';

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

  RxBool isAllVaildEntries = RxBool(false);
  RxBool isSameAsShippingAddress = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    _setupPrice();
  }

  void _setupPrice() {
    productDetailData =
        Get.find<ProductDetailController>().productDetailData.value;
    ticketPrice = int.parse(productDetailData.ticketPrice ?? '');
    _calculateTotal();
  }

  void increaseTotalTickets() {
    totalTickets.value++;
    _calculateTotal();
  }

  void decreseTotalTickets() {
    totalTickets.value--;
    if (totalTickets.value < 1) {
      totalTickets.value = 1;
    }
    _calculateTotal();
  }

  void _calculateTotal() {
    total.value = totalTickets.value * ticketPrice;
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

  Future<void> checkOut() async {
    Map<String, dynamic> params = {};

    if (productDetailData.id != null) {
      params['raffle_id'] = productDetailData.id;
    }
    params['quantity'] = totalTickets.value;
    params['paymet_method'] = 'card';

    if (isSameAsShippingAddress.value) {
      params['full_name'] = fullName.value;
      params['street_1'] = street.value;
      params['street_2'] = anotherStreet.value;
      params['city'] = city.value;
      params['state'] = state.value;
      params['zip_code'] = zipCode.value;
    } else {
      params['billing_full_name'] = fullName.value;
      params['billing_street_1'] = street.value;
      params['billing_street_2'] = anotherStreet.value;
      params['billing_city'] = city.value;
      params['billing_state'] = state.value;
      params['billing_zip_code'] = zipCode.value;
    }

    ResponseModel responseModel = await sharedServiceManager.createPostRequest(
        typeOfEndPoint: APIType.checkout, params: params);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}

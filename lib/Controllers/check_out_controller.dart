import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Controllers/product_detail_controller.dart';
import 'package:assement/Models/DataModels/product_detail_models.dart';
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
}

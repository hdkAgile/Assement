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
  RxString street = ''.obs;
  RxString anotherStreet = ''.obs;
  RxString city = ''.obs;
  RxString state = ''.obs;
  RxString zipCode = ''.obs;

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
    if (GetUtils.isLengthLessOrEqual(fullName, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid full name', 'Please enter full name', Position.bottom);
    }
    if (GetUtils.isLengthLessOrEqual(street, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Address', 'Please enter address', Position.bottom);
    }

    if (GetUtils.isLengthLessOrEqual(anotherStreet, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid Address', 'Please enter address', Position.bottom);
    }

    if (GetUtils.isLengthLessOrEqual(city, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid City', 'Please enter city', Position.bottom);
    }

    if (GetUtils.isLengthLessOrEqual(state, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid State', 'Please enter state', Position.bottom);
    }

    if (GetUtils.isLengthLessOrEqual(zipCode, 0)) {
      AlertManagerController.showSnackBar(
          'Invalid zip code', 'Please enter zipcode', Position.bottom);
    }
  }
}

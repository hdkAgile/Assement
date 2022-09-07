import 'package:assement/Controllers/product_detail_controller.dart';
import 'package:assement/Models/DataModels/product_detail_models.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  RxInt totalTickets = 1.obs;
  int ticketPrice = 5;
  RxInt total = 5.obs;
  ProductDetailData productDetailData = ProductDetailData();

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
}

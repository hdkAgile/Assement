import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Controllers/favourite_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:get/get.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutController());
  }
}

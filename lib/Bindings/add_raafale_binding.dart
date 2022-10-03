import 'package:assement/Controllers/add_raafale_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:get/get.dart';

class AddRaffaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddRaffaleController(), fenix: false);
  }
}

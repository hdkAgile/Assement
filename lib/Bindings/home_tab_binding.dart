import 'package:assement/Controllers/home_controller.dart';
import 'package:assement/Controllers/home_tab_controller.dart';
import 'package:get/get.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabController());
  }
}

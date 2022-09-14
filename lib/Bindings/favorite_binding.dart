import 'package:assement/Controllers/favourite_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}

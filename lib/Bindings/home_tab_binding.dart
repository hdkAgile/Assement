import 'package:assement/Controllers/add_raafale_controller.dart';
import 'package:assement/Controllers/favourite_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:assement/Controllers/home_tab_controller.dart';
import 'package:assement/Controllers/message_notification_controller.dart';
import 'package:assement/Controllers/search_controller.dart';
import 'package:get/get.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabController());
  }
}

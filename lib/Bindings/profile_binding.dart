import 'package:assement/Controllers/profile_controller.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(
        offset: 0, limit: 10, id: 0, userType: UserType.current));
  }
}

import 'package:get/get.dart';

class HomeTabController extends GetxController {
  RxInt selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeIndex(int index) {
    selectedTab.value = index;
  }
}

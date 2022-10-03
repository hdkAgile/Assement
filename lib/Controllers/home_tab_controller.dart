import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Views/Custom/search_tab.dart';
import '../Views/favourite_view.dart';
import '../Views/home.dart';
import '../Views/message_notification_view.dart';

class HomeTabController extends GetxController {
  RxInt selectedTab = 0.obs;

  List<Widget> items = [
    Home(),
    Search(),
    Container(),
    MessageNotificationView(),
    FavouriteView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void onItemSelected(int index) {
    selectedTab.value = index;
  }

  Widget getSelectedScreen() {
    return items[selectedTab.value];
  }
}

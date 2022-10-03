import 'package:assement/Bindings/add_raafale_binding.dart';
import 'package:assement/Controllers/home_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import 'Custom/search_tab.dart';
import 'add_raffle_view.dart';
import 'favourite_view.dart';
import 'home.dart';
import 'message_notification_view.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  HomeTabController controller = Get.find<HomeTabController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          body: controller.getSelectedScreen(),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedTab.value,
            selectedItemColor: AppColors.themeGreen,
            iconSize: 25.0,
            elevation: 5,
            onTap: controller.onItemSelected,
            items: [
              BottomNavigationBarItem(
                  icon: controller.selectedTab.value == 0
                      ? Image.asset(AppImages.homeTabActiveIcon)
                      : Image.asset(AppImages.homeTabIcon),
                  label: ''),
              BottomNavigationBarItem(
                  icon: controller.selectedTab.value == 1
                      ? Image.asset(AppImages.searchTabActiveIcon)
                      : Image.asset(AppImages.searchTabIcon),
                  label: ''),
              BottomNavigationBarItem(icon: Container(), label: ''),
              BottomNavigationBarItem(
                  icon: controller.selectedTab.value == 3
                      ? Image.asset(AppImages.notificationTabActiveIcon)
                      : Image.asset(AppImages.notificationTabIcon),
                  label: ''),
              BottomNavigationBarItem(
                  icon: controller.selectedTab.value == 4
                      ? Image.asset(AppImages.profileTabActiveIcon)
                      : Image.asset(AppImages.profileTabIcon),
                  label: ''),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: FloatingActionButton(
              elevation: 5.0,
              onPressed: () {
                Get.to(() => AddRaffleView(), binding: AddRaffaleBinding());
              },
              backgroundColor: AppColors.themeGreen,
              child: Center(
                  child:
                      Image.asset(AppImages.plus, height: 55.w, width: 55.w)),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}

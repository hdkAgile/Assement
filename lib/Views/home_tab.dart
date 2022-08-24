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
import 'notification_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  List<Widget> items = [
    Home(),
    Search(),
    Container(),
    NotificationView(),
    FavouriteView(),
  ];

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getSelectedScreen() {
    return items[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.themeGreen,
        iconSize: 25.0,
        elevation: 5,
        onTap: onItemSelected,
        items: [
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? Image.asset(AppImages.homeTabActiveIcon)
                  : Image.asset(AppImages.homeTabIcon),
              label: ''),
          BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? Image.asset(AppImages.searchTabActiveIcon)
                  : Image.asset(AppImages.searchTabIcon),
              label: ''),
          BottomNavigationBarItem(icon: Container(), label: ''),
          BottomNavigationBarItem(
              icon: selectedIndex == 3
                  ? Image.asset(AppImages.notificationTabActiveIcon)
                  : Image.asset(AppImages.notificationTabIcon),
              label: ''),
          BottomNavigationBarItem(
              icon: selectedIndex == 4
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
            Get.to(AddRaffleView());
          },
          backgroundColor: AppColors.themeGreen,
          child: Center(
              child: Image.asset(AppImages.plus, height: 55.w, width: 55.w)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

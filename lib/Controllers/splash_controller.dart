import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/DataModels/app_user.dart';
import '../Views/home_tab.dart';
import '../Views/welcome.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _isUserLoggedIn();
  }

  void _isUserLoggedIn() async {
    if (await AppUser.isLoginVerified()) {
      await sharedUser.loadUserDetails();
      _setRootView(const HomeTab());
    } else {
      _setRootView(const WelComeView());
    }
  }

  _setRootView(Widget screen) {
    Get.offAll(screen);
  }
}

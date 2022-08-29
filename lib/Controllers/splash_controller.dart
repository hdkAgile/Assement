import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/DataModels/app_user.dart';
import '../Views/home_tab.dart';
import '../Views/welcome.dart';

class SplashController extends GetxController {
  bool isLoggedIn = false;

  Future<void> isUserLoggedIn() async {
    isLoggedIn = await AppUser.isLoginVerified();
    if (isLoggedIn) {
      await sharedUser.loadUserDetails();
    }
    update();
  }
}

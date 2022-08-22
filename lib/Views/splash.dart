import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Controllers/splash_controller.dart';
import '../Utils/constants.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeGreen,
      body: SafeArea(
        top: false,
        bottom: false,
        right: false,
        left: false,
        child: Center(child: Image.asset(AppImages.splashImage)),
      ),
    );
  }
}

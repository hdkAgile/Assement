import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Utils/constants.dart';

enum Position { top, bottom }

extension PositionExtention on Position {
  SnackPosition get snackPosition {
    switch (this) {
      case Position.bottom:
        return SnackPosition.BOTTOM;
      case Position.top:
        return SnackPosition.TOP;
    }
  }
}

class AlertManagerController {
  static void showSnackBar(String title, String message, Position position) {
    Get.showSnackbar(GetSnackBar(
        maxWidth: double.infinity,
        messageText:
            Text(message, style: AppTextStyle.openSans_bold_themeWhite_14),
        backgroundColor: AppColors.themeGreen,
        snackPosition: position.snackPosition,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 2)));
  }

  static showLoaderDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
              child: CircularProgressIndicator(color: AppColors.themeGreen));
        },
        barrierDismissible: false);
  }

  static hideLoaderDialog() {
    Get.back();
  }
}

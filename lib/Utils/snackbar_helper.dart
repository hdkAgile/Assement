import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

enum SnackType { success, error, warning, info }

class SnackbarUtil {
  static void showSnackbar({
    required BuildContext context,
    required SnackType type,
    required String message,
  }) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message.tr,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontFamily: AppFonts.openSansSemiBold,
            ),
      ),
      backgroundColor: getBackgroundColorByType(snackType: type),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Color getBackgroundColorByType({required SnackType snackType}) {
    switch (snackType) {
      case SnackType.success:
        return AppColors.themeGreen;
      case SnackType.warning:
        return AppColors.themeBlue;
      case SnackType.error:
        return Colors.red;
      default:
        return AppColors.themeGreen;
    }
  }
}

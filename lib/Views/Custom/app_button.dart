import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/constants.dart';

class AppButton extends StatelessWidget {
  String title;
  bool isEnable;
  double? height;
  double? width;
  Function()? onPressed;

  AppButton(
      {required this.title,
      required this.isEnable,
      this.height,
      this.width,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  isEnable ? AppColors.themeGreen : AppColors.themeLightGrey),
          color: isEnable
              ? AppColors.themeGreen
              : AppColors.themeLightGrey.withOpacity(1.0),
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: isEnable
                  ? AppColors.themeGreen.withOpacity(0.5)
                  : AppColors.themeLightGrey.withOpacity(1.0),
              spreadRadius: 1.r,
              blurRadius: 5.r,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(title,
              style: isEnable
                  ? AppTextStyle.openSans_bold_white_17
                  : AppTextStyle.openSans_bold_darkGrey_17),
        ));
  }
}

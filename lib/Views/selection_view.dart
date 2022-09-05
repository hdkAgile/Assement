import 'package:assement/Controllers/add_raafale_controller.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/enum_all.dart';

class SelectionView extends StatelessWidget {
  String title;
  bool isSelected = false;
  SelectionView({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.openSans_regular_themeBlack_14),
        Visibility(
          visible: isSelected,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9.r),
            child: Image.asset(
              AppImages.checkBox,
              height: 18.w,
              width: 18.w,
            ),
          ),
        )
      ],
    );
  }
}

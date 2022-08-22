import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/constants.dart';

class AppSearchField extends StatelessWidget {
  String? labelText;
  String? hintText;
  TextStyle? labelTextStyle;
  TextStyle? hintTextStyle;
  double? height;

  AppSearchField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.hintTextStyle,
      this.labelTextStyle,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: height,
          decoration: BoxDecoration(
              color: AppColors.themeLightTextGrey,
              borderRadius: BorderRadius.circular(4.0)),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: AppColors.themeDarkGrey,
                border: InputBorder.none,
                labelText: labelText,
                hintText: hintText,
                labelStyle: labelTextStyle,
                hintStyle: hintTextStyle),
          )),
    );
  }
}

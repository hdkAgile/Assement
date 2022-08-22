import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants.dart';

class AppTextField extends StatelessWidget {
  String? labelText;
  String? hintText;
  TextEditingController? controller;
  bool isObscure = false;
  Function(String)? onChanged;
  TextInputType? textInputType;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;

  AppTextField(
      {this.labelText,
      this.hintText,
      this.controller,
      required this.isObscure,
      this.onChanged,
      this.textInputType,
      this.maxLength,
      this.inputFormatters,
      this.textInputAction,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.themeLightGrey),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.themeLightGrey,
        ),
        child: TextField(
            maxLines: 1,
            controller: controller,
            onChanged: onChanged,
            obscureText: isObscure,
            keyboardType: textInputType,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style: TextStyle(
                fontFamily: '.SF Pro Display',
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.themeBlack),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                border: InputBorder.none,
                labelText: labelText,
                labelStyle: TextStyle(
                  color: AppColors.themeTextGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                hintStyle: TextStyle(
                  color: AppColors.themeTextGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
                hintText: hintText)));
  }
}

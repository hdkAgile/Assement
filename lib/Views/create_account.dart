import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/constants.dart';
import '../Utils/enum_all.dart';
import 'login.dart';

class CreateAccount extends StatelessWidget {
  SignUpType type;
  CreateAccount({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: type.value,
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColors.themeWhite,
          title: Text(AppText.createAccount,
              style: AppTextStyle.openSans_semibold_black_18),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Container(
                  height: 17.h,
                  width: 22.w,
                  child: Image.asset(AppImages.backArrow,
                      color: AppColors.themeBlack))),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25.sp),
                child: TabBar(
                  automaticIndicatorColorAdjustment: false,
                  unselectedLabelColor: AppColors.themeBlack,
                  unselectedLabelStyle: AppTextStyle.openSans_regular_black_15,
                  labelColor: AppColors.themeGreen,
                  labelStyle: AppTextStyle.openSans_bold_green_15,
                  indicatorWeight: 3,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 30.w),
                  indicatorColor: AppColors.themeBorderGreen,
                  tabs: [
                    Tab(text: AppText.signUp),
                    Tab(text: AppText.loginTab)
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  SignUp(),
                  Login(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

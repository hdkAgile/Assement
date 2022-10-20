import 'dart:io';

import 'package:assement/Bindings/login_binding.dart';
import 'package:assement/Bindings/signUp_binding.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../Utils/constants.dart';
import '../Utils/enum_all.dart';
import 'create_account.dart';

class WelComeView extends StatefulWidget {
  const WelComeView({Key? key}) : super(key: key);

  @override
  State<WelComeView> createState() => _WelComeViewState();
}

class _WelComeViewState extends State<WelComeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset(AppImages.splashImage),
                ),
              ),
            ),
            Visibility(
              visible: Platform.isIOS,
              child: GestureDetector(
                onTap: () async {
                  final creds =
                      await SignInWithApple.getAppleIDCredential(scopes: [
                    AppleIDAuthorizationScopes.email,
                    AppleIDAuthorizationScopes.fullName,
                  ]);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 23, right: 23),
                  width: double.infinity,
                  height: 46.0.h,
                  decoration: BoxDecoration(
                      color: AppColors.themeBlack,
                      borderRadius: BorderRadius.circular(23.0.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.apple,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(AppText.signWithApple,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.openSans_bold_white_16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(visible: Platform.isIOS, child: SizedBox(height: 26.h)),
            Container(
              margin: EdgeInsets.only(left: 23, right: 23),
              height: 46.0.h,
              decoration: BoxDecoration(
                  color: AppColors.themeBlue,
                  borderRadius: BorderRadius.circular(23.0.r)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(AppText.signWithFacebook,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.openSans_bold_white_16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
            Text(AppText.useYourEmail,
                textAlign: TextAlign.center,
                style: AppTextStyle.openSans_semibold_black_12),
            Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(ScreenRoutesConstant.signUpAccount);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 46.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.themeBorderGreen),
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Center(
                            child: Text(AppText.signUp,
                                style: AppTextStyle.openSans_bold_green_18),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(ScreenRoutesConstant.loginAccount);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 46.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.themeBorderGreen),
                            borderRadius: BorderRadius.circular(23.r),
                          ),
                          child: Center(
                              child: Text(AppText.logIn,
                                  style: AppTextStyle.openSans_bold_green_18)),
                        )),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50.h)),
          ],
        ),
      ),
    );
  }
}

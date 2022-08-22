import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/sign_up_controller.dart';
import '../Utils/constants.dart';
import 'Custom/app_button.dart';
import 'Custom/app_textfield.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignUpController signUpController = Get.put(SignUpController());

  bool isVaildEntry() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28, right: 28, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppTextField(
                            controller: _emailController,
                            isObscure: false,
                            labelText: AppText.email,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              LengthLimitingTextInputFormatter(60),
                            ],
                            onChanged: (value) {
                              setState(() {});
                            }),
                        SizedBox(height: 20.h),
                        AppTextField(
                            controller: _passwordController,
                            labelText: AppText.password,
                            isObscure: true,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              LengthLimitingTextInputFormatter(40),
                            ],
                            onChanged: (value) {
                              setState(() {});
                            }),
                        SizedBox(height: 10.h),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppText.forgotPassword,
                                  style: AppTextStyle
                                      .openSans_semibold_darkGrey_10,
                                )))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'By continuing, you agree to our ',
                              style: AppTextStyle
                                  .sfProDisplay_regular_themeLightTextGrey_12,
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    text: 'Terms & Conditions',
                                    style: AppTextStyle
                                        .sfProDisplay_regular_themeGreen_12),
                                TextSpan(
                                    text: ' and ',
                                    style: AppTextStyle
                                        .sfProDisplay_regular_themeLightTextGrey_12),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    text: 'Privacy Policy.',
                                    style: AppTextStyle
                                        .sfProDisplay_regular_themeGreen_12),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: isVaildEntry()
                                    ? AppColors.themeGreen
                                    : AppColors.themeLightGrey),
                            color: isVaildEntry()
                                ? AppColors.themeGreen
                                : AppColors.themeLightGrey.withOpacity(1.0),
                            borderRadius: BorderRadius.circular(25.r),
                            boxShadow: [
                              BoxShadow(
                                color: isVaildEntry()
                                    ? AppColors.themeGreen.withOpacity(0.5)
                                    : AppColors.themeLightGrey.withOpacity(1.0),
                                spreadRadius: 1.r,
                                blurRadius: 5.r,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: AppButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {});
                                // Get.to(HomeTab());
                                signUpController.loginValidation(
                                    _emailController.text,
                                    _passwordController.text);
                              },
                              height: 50.h,
                              title: AppText.logIn,
                              isEnable: isVaildEntry()),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 40))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

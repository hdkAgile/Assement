import 'package:assement/Controllers/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/sign_up_controller.dart';
import '../Utils/constants.dart';
import '../Utils/enum_all.dart';
import 'Custom/app_button.dart';
import 'Custom/app_textfield.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();

  // bool isVaildEntry() {
  //   return loginController.email.value.isNotEmpty &&
  //       loginController.password.value.isNotEmpty;
  // }

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
                            isObscure: false,
                            labelText: AppText.email,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              LengthLimitingTextInputFormatter(60),
                            ],
                            onChanged: (value) {
                              loginController.email.value = value;
                              loginController.shoudldButtonEnable();
                            }),
                        SizedBox(height: 20.h),
                        AppTextField(
                            labelText: AppText.password,
                            isObscure: true,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              LengthLimitingTextInputFormatter(40),
                            ],
                            onChanged: (value) {
                              loginController.password.value = value;
                              loginController.shoudldButtonEnable();
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
                        child: Obx(() => AppButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              loginController.loginValidation();
                            },
                            height: 50.h,
                            width: double.infinity,
                            title: AppText.logIn,
                            isEnable: loginController.isEnable.value)),
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

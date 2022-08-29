import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controllers/sign_up_controller.dart';
import '../Utils/constants.dart';
import '../Utils/enum_all.dart';
import 'Custom/app_button.dart';
import 'Custom/app_textfield.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpController signUpController = Get.find<SignUpController>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // bool isVaildEntry() {
  //   return _firstNameController.text.isNotEmpty &&
  //       _lastNameController.text.isNotEmpty &&
  //       _emailController.text.isNotEmpty &&
  //       _passwordController.text.isNotEmpty;
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
                      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppTextField(
                              labelText: AppText.firstName,
                              isObscure: false,
                              controller: _firstNameController,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z-_A-Z]')),
                                LengthLimitingTextInputFormatter(14),
                              ],
                              onChanged: (value) {
                                signUpController.firstName.value = value;
                                signUpController.shoudldButtonEnable();
                              }),
                          SizedBox(height: 20.h),
                          AppTextField(
                              labelText: AppText.lastName,
                              isObscure: false,
                              controller: _lastNameController,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z-_A-Z]')),
                                LengthLimitingTextInputFormatter(14),
                              ],
                              onChanged: (value) {
                                signUpController.lastName.value = value;
                                signUpController.shoudldButtonEnable();
                              }),
                          SizedBox(height: 20.h),
                          AppTextField(
                              labelText: AppText.email,
                              isObscure: false,
                              textInputType: TextInputType.emailAddress,
                              controller: _emailController,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z-_@.A-Z]')),
                              ],
                              onChanged: (value) {
                                signUpController.email.value = value;
                                signUpController.shoudldButtonEnable();
                              }),
                          SizedBox(height: 20.h),
                          AppTextField(
                              labelText: AppText.password,
                              isObscure: true,
                              controller: _passwordController,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-z@A-Z0-9]')),
                                LengthLimitingTextInputFormatter(14),
                              ],
                              onChanged: (value) {
                                signUpController.password.value = value;
                                signUpController.shoudldButtonEnable();
                              }),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 55),
                        child: Obx(() => AppButton(
                            onPressed: () {
                              signUpController.validation();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            height: 50.h,
                            title: AppText.signUp,
                            isEnable: signUpController.isEnable.value))),
                  ],
                )),
          );
        },
      ),
    );
  }
}

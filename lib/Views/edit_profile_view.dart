import 'package:assement/Controllers/profile_controller.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import '../Utils/enum_all.dart';

class EditProfileView extends StatelessWidget {
  EditFieds field;

  EditProfileView({required this.field, Key? key}) : super(key: key);

  ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    controller.setup(field);
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          field.title,
          style: AppTextStyle.openSans_semibold_themeBlack_15,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(AppImages.backArrow)),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              color: AppColors.themeLightGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      field.title,
                      style: AppTextStyle.openSans_regular_themeBlack_12,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: controller.textEditingController,
                      textAlign: TextAlign.right,
                      style: AppTextStyle.openSans_bold_themeBlack_14,
                      textDirection: TextDirection.ltr,
                      onChanged: (value) {
                        controller.text.value = value;
                      },
                      decoration: InputDecoration(
                          hintTextDirection: TextDirection.ltr,
                          border: InputBorder.none,
                          hintText: field.title),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() => AppButton(
                    onPressed: () async {
                      final value = controller.validate(field);
                      if (value) {
                        final isUpdated = await controller.updateProfile(field);
                        if (isUpdated) {
                          Get.back();
                        }
                      }
                    },
                    title: 'Save',
                    isEnable: controller.text.value.isNotEmpty)))
          ],
        ),
      ),
    );
  }
}

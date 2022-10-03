import 'package:assement/Controllers/home_tab_controller.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:assement/Views/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/add_raafale_controller.dart';

class CompleteAddRaaflale extends StatelessWidget {
  CompleteAddRaaflale({Key? key}) : super(key: key);

  AddRaffaleController controller = Get.find<AddRaffaleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            'Details',
            style: AppTextStyle.openSans_semibold_themeBlack_15,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80.w,
              width: 80.w,
              child: Image.asset(AppImages.doneImage),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppText.congratualtion,
                  style: AppTextStyle.openSans_bold_themeBlack_29,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(AppText.raffaleListed,
                    style: AppTextStyle.openSans_regular_themeBlack_16)
              ],
            ),
            Visibility(
              visible: controller.images.isNotEmpty,
              child: AspectRatio(
                aspectRatio: 340 / 190,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: ImageView(
                      fit: BoxFit.cover,
                      image: controller.images[0].path,
                      imageType: ImageType.file,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              child: Column(
                children: [
                  AppButton(
                      onPressed: () {
                        Get.offAllNamed(ScreenRoutesConstant.homeTab);
                      },
                      height: 50.h,
                      width: double.infinity,
                      title: AppText.done,
                      isEnable: true),
                  SizedBox(
                    height: 34.h,
                  ),
                  AppButton(
                      height: 50.h,
                      width: double.infinity,
                      title: 'View Listing',
                      style: AppTextStyle.openSans_bold_themeBlack_18,
                      isEnable: false,
                      onPressed: () {
                        HomeTabController controller =
                            Get.find<HomeTabController>();
                        controller.onItemSelected(2);
                      })
                ],
              ),
            ),
          ],
        ));
  }
}

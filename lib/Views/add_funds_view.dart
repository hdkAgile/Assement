import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/wallet_controller.dart';
import '../Utils/constants.dart';

class AddFundsView extends StatelessWidget {
  AddFundsView({Key? key}) : super(key: key);

  WalletController controller = Get.find<WalletController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'My Wallet',
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: AppColors.themeLightGrey,
              margin: EdgeInsets.only(top: 17.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: AppTextStyle.openSans_regular_themeBlack_12,
                  ),
                  Text(
                    '\$ ${controller.wallet.value?.amount}',
                    style: AppTextStyle.openSans_bold_themeBlack_21,
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 31.h, right: 20.w, left: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.themeWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey.shade100, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageView(
                          image: AppImages.elipseGreen,
                          imageType: ImageType.asset),
                      Text(
                        '\$ 10.00',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.openSans_bold_themeBlack_20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.themeWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey.shade100, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageView(
                          image: AppImages.elipseGreen,
                          imageType: ImageType.asset),
                      Text(
                        '\$ 10.00',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.openSans_bold_themeBlack_20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.themeWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey.shade100, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageView(
                          image: AppImages.elipseGreen,
                          imageType: ImageType.asset),
                      Text(
                        '\$ 10.00',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.openSans_bold_themeBlack_20,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: AppColors.themeWhite,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey.shade100, width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageView(
                          image: AppImages.elipseGreen,
                          imageType: ImageType.asset),
                      Text(
                        'Add Amount',
                        textAlign: TextAlign.right,
                        style: AppTextStyle.openSans_bold_themeBlack_20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
              child: AppButton(isEnable: true, title: "Add Funds"),
            )
          ],
        ),
      ),
    );
  }
}

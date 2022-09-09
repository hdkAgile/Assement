import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Views/completed_check_out_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import 'Custom/app_button.dart';
import 'Custom/image_view.dart';

class FinalCheckOutView extends StatelessWidget {
  FinalCheckOutView({Key? key}) : super(key: key);

  CheckOutController controller = Get.find<CheckOutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeLightGrey,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(AppText.checkOut,
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
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: AppColors.themeWhite,
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: ImageView(
                                    fit: BoxFit.cover,
                                    height: 84.w,
                                    width: 84.w,
                                    image: controller
                                            .productDetailData.images?.first ??
                                        '',
                                    imageType: ImageType.networkImage,
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Text(controller.productDetailData.title ?? '',
                                    style: AppTextStyle
                                        .openSans_bold_themeBlack_18)
                              ],
                            ),
                            Container(
                              height: 41.h,
                              width: 73.w,
                              decoration: BoxDecoration(
                                  color: AppColors.themeGreen,
                                  borderRadius: BorderRadius.circular(11.r)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ImageView(
                                      imageType: ImageType.asset,
                                      image: AppImages.ticket,
                                      height: 20.w,
                                      width: 20.w,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(11.r),
                                              bottomRight:
                                                  Radius.circular(11.r)),
                                          color: AppColors.themeWhite),
                                      child: Center(
                                        child: Text(
                                          controller.totalTickets.toString(),
                                          style: AppTextStyle
                                              .openSans_bold_themeBlack_18,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Divider(
                      height: 0.5.h,
                      color: AppColors.themeTextGrey.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppText.shippingAddress.toUpperCase(),
                              style: AppTextStyle.openSans_bold_themeGreen_12)),
                    ),
                    Container(
                      color: AppColors.themeLightGrey,
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.street.value,
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                              ),
                              Text(
                                controller.anotherStreet.value,
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'EDIT',
                                style: AppTextStyle.openSans_bold_themeBlack_12,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppText.paymentMethod.toUpperCase(),
                              style: AppTextStyle.openSans_bold_themeGreen_12)),
                    ),
                    Container(
                      color: AppColors.themeLightGrey,
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.street.value,
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                              ),
                              Text(
                                controller.anotherStreet.value,
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'EDIT',
                                style: AppTextStyle.openSans_bold_themeBlack_12,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 75.h,
                    )
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 375 / 260,
                child: Container(
                  padding: EdgeInsets.all(30.sp),
                  color: AppColors.themeLightGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Tickets',
                            style: AppTextStyle.openSans_semibold_themeBlack_15,
                          ),
                          Obx(() => Text(
                                '${controller.totalTickets}',
                                style: AppTextStyle.openSans_bold_themeBlack_14,
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ticket Price',
                            style: AppTextStyle.openSans_semibold_themeBlack_15,
                          ),
                          Text(
                            '\$ ${controller.ticketPrice}',
                            style: AppTextStyle.openSans_bold_themeBlack_14,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: AppTextStyle.openSans_bold_themeBlack_18),
                          Obx(() => Text('\$ ${controller.total}',
                              style: AppTextStyle.openSans_bold_themeBlack_18))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: AppButton(
                              title: 'Next',
                              isEnable: true,
                              onPressed: () {
                                Get.offAll(() => CompleteCheckOutView());
                              }))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

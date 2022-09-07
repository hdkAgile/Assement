import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:assement/Views/checkout_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({Key? key}) : super(key: key);
  CheckOutController controller = Get.put(CheckOutController());
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
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  color: AppColors.themeWhite,
                  padding: EdgeInsets.symmetric(horizontal: 35.h),
                  child: Center(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: AppColors.themeGreen,
                          border: Border.all(color: AppColors.themeGreen),
                          borderRadius: BorderRadius.circular(13.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: ImageView(
                                height: 10.w,
                                width: 50.w,
                                image: AppImages.ticket,
                                imageType: ImageType.asset),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 3.sp, horizontal: 3.sp),
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.themeWhite,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(13.r),
                                      bottomRight: Radius.circular(13.r))),
                              child: Row(
                                textBaseline: TextBaseline.alphabetic,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.decreseTotalTickets();
                                    },
                                    icon: Icon(
                                      Icons.remove_circle,
                                      size: 40.0,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.totalTickets.toString(),
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_60,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.increaseTotalTickets();
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
                              Get.to(() => CheckOutDetailView());
                            }))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

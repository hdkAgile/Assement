import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:assement/Views/add_shiping_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';

class CheckOutDetailView extends StatelessWidget {
  CheckOutDetailView({Key? key}) : super(key: key);

  CheckOutController controller = Get.find<CheckOutController>();

  @override
  Widget build(BuildContext context) {
    print(controller);
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                            image: controller.productDetailData.images?.first ??
                                '',
                            imageType: ImageType.networkImage,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Text(controller.productDetailData.title ?? '',
                            style: AppTextStyle.openSans_bold_themeBlack_18)
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
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(11.r),
                                      bottomRight: Radius.circular(11.r)),
                                  color: AppColors.themeWhite),
                              child: Center(
                                child: Text(
                                  controller.totalTickets.toString(),
                                  style:
                                      AppTextStyle.openSans_bold_themeBlack_18,
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
              height: 23.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    AppText.paymentMethod,
                    style: AppTextStyle.openSans_bold_themeGreen_14,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.themeWhite,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: kElevationToShadow[8]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppText.applePay,
                          style: AppTextStyle.openSans_semibold_themeBlack_14,
                        ),
                        ImageView(
                          image: AppImages.blackArrowRight,
                          imageType: ImageType.asset,
                          color: AppColors.themeGreen,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AddShippingAddressView());
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.creditCard,
                            style: AppTextStyle.openSans_semibold_themeBlack_14,
                          ),
                          ImageView(
                            image: AppImages.blackArrowRight,
                            imageType: ImageType.asset,
                            color: AppColors.themeGreen,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppText.paypal,
                          style: AppTextStyle.openSans_semibold_themeBlack_14,
                        ),
                        ImageView(
                          image: AppImages.blackArrowRight,
                          imageType: ImageType.asset,
                          color: AppColors.themeGreen,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

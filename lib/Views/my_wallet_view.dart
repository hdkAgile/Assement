import 'package:assement/Controllers/wallet_controller.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/add_funds_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import 'Custom/image_view.dart';
import 'card_list_view.dart';

class MyWalletView extends StatelessWidget {
  MyWalletView({Key? key}) : super(key: key);
  WalletController controller = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.0,
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
        bottom: false,
        top: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 18),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(AppImages.info),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.yellow,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              '\$ ${controller.wallet?.value?.amount ?? 0}',
                              style: AppTextStyle.openSans_bold_themeBlack_51,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35.w, vertical: 33.h),
                            child: AspectRatio(
                                aspectRatio: 234.w / 34.h,
                                child: AppButton(
                                  title: 'Add Funds',
                                  isEnable: true,
                                  onPressed: () {
                                    Get.to(() => AddFundsView());
                                  },
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 0.5,
              color: AppColors.themeLightGrey,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.all(26),
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
                            border: Border.all(
                                color: Colors.grey.shade100, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(CardListView());
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppText.wallet,
                                        style: AppTextStyle
                                            .openSans_semibold_themeBlack_14,
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

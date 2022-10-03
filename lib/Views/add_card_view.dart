import 'package:assement/Controllers/card_controller.dart';
import 'package:assement/Controllers/check_out_controller.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/card_input_formatter.dart';
import '../Utils/card_month_input_formatter.dart';
import '../Utils/constants.dart';

class AddCardView extends StatelessWidget {
  AddCardView({Key? key}) : super(key: key);
  CardController controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: Text(AppText.addCard,
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
          Container(
            margin: EdgeInsets.only(top: 20),
            constraints: BoxConstraints(maxHeight: 170.h),
            color: AppColors.themeLightGrey,
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 0, bottom: 8, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        label: Text("Full Name"),
                        labelStyle: AppTextStyle.openSans_regular_themeBlack_10,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.themeTextGrey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.themeTextGrey))),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(19),
                    ],
                    onChanged: (value) {
                      controller.fullName.value = value;
                      controller.checkValidation();
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        label: Text("CARD NUMBER"),
                        labelStyle: AppTextStyle.openSans_regular_themeBlack_10,
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.themeTextGrey)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.themeTextGrey))),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      CardNumberInputFormatter()
                    ],
                    onChanged: (value) {
                      controller.cardNumber.value = value;
                      controller.checkValidation();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                              label: Text("MM/YY"),
                              labelStyle:
                                  AppTextStyle.openSans_regular_themeBlack_10,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.themeTextGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.themeTextGrey))),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter(),
                          ],
                          onChanged: (value) {
                            final strValue = value.split('/');
                            print(strValue);
                            controller.month.value = strValue.first;
                            controller.year.value = strValue.last;
                            controller.checkValidation();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        height: 40.h,
                        width: 0.5,
                        color: AppColors.themeTextGrey,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          obscureText: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: InputDecoration(
                              label: Text("CVV"),
                              labelStyle:
                                  AppTextStyle.openSans_regular_themeBlack_10,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.themeTextGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.themeTextGrey))),
                          onChanged: (value) {
                            controller.cvv.value = value;
                            controller.checkValidation();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Obx(
                () => AppButton(
                  title: "Add Card",
                  isEnable: controller.isAllVaildEntries.value,
                  onPressed: controller.isAllVaildEntries.value
                      ? () async {
                          await controller.addCard();
                        }
                      : null,
                ),
              ))
        ],
      )),
    );
  }
}

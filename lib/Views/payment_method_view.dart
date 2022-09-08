import 'package:assement/Utils/card_month_input_formatter.dart';
import 'package:assement/Views/final_check_out_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/check_out_controller.dart';
import '../Utils/card_input_formatter.dart';
import '../Utils/constants.dart';
import 'Custom/app_button.dart';

class PaymentMethodView extends StatelessWidget {
  PaymentMethodView({Key? key}) : super(key: key);
  CheckOutController controller = Get.find<CheckOutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: Text('Payment Method',
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    constraints: BoxConstraints(maxHeight: 135.h),
                    color: AppColors.themeLightGrey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16, top: 0, bottom: 8, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                label: Text("CARD NUMBER"),
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
                              LengthLimitingTextInputFormatter(19),
                              CardNumberInputFormatter()
                            ],
                            onChanged: (value) {
                              controller.fullName.value = value;
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
                                      labelStyle: AppTextStyle
                                          .openSans_regular_themeBlack_10,
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
                                    controller.city.value = value;
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
                                  decoration: InputDecoration(
                                      label: Text("CVV"),
                                      labelStyle: AppTextStyle
                                          .openSans_regular_themeBlack_10,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.themeTextGrey)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.themeTextGrey))),
                                  onChanged: (value) {
                                    controller.state.value = value;
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
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              AppText.billingAddress,
                              style: AppTextStyle.openSans_bold_themeGreen_14,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  activeColor: AppColors.themeGreen,
                                  value:
                                      controller.isSameAsShippingAddress.value,
                                  onChanged: (value) {
                                    controller.isSameAsShippingAddress.value =
                                        value ?? false;
                                  }),
                            ),
                            Text(
                              'Same as Shipping',
                              style: AppTextStyle.openSans_regular_themeBlack_9,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: AppColors.themeLightGrey,
                      margin: EdgeInsets.only(top: 0),
                      width: double.infinity,
                      constraints: BoxConstraints(maxHeight: 300.h),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16, top: 0, bottom: 8, right: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  label: Text("FULL NAME"),
                                  labelStyle: AppTextStyle
                                      .openSans_regular_themeBlack_10,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey))),
                              onChanged: (value) {
                                controller.fullName.value = value;
                                controller.checkValidation();
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  label: Text("STREET"),
                                  labelStyle: AppTextStyle
                                      .openSans_regular_themeBlack_10,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey))),
                              onChanged: (value) {
                                controller.street.value = value;
                                controller.checkValidation();
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  label: Text("STREET 2"),
                                  labelStyle: AppTextStyle
                                      .openSans_regular_themeBlack_10,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey))),
                              onChanged: (value) {
                                controller.anotherStreet.value = value;
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
                                        label: Text("CITY"),
                                        labelStyle: AppTextStyle
                                            .openSans_regular_themeBlack_10,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.themeTextGrey)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.themeTextGrey))),
                                    onChanged: (value) {
                                      controller.city.value = value;
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
                                    decoration: InputDecoration(
                                        label: Text("STATE"),
                                        labelStyle: AppTextStyle
                                            .openSans_regular_themeBlack_10,
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.themeTextGrey)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    AppColors.themeTextGrey))),
                                    onChanged: (value) {
                                      controller.state.value = value;
                                      controller.checkValidation();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text("ZIP CODE"),
                                  labelStyle: AppTextStyle
                                      .openSans_regular_themeBlack_9,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.themeTextGrey))),
                              onChanged: (value) {
                                controller.zipCode.value = value;
                                controller.checkValidation();
                              },
                            ),
                          ],
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                      child: AppButton(
                          title: 'Next',
                          isEnable: true,
                          onPressed: () {
                            Get.to(FinalCheckOutView());
                          }))
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}

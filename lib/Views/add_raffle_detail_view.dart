import 'package:assement/Views/Custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import 'Custom/image_view.dart';

class AddDetailView extends StatelessWidget {
  const AddDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppText.detail,
            style: AppTextStyle.openSans_bold_themeBlack_14,
          ),
          leadingWidth: 80.0.w,
          leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              AppText.cancel,
              style: AppTextStyle.openSans_semibold_black_12,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: AppText.photos.toUpperCase(),
                            style: AppTextStyle.openSans_bold_themeGreen_16,
                            children: <TextSpan>[
                          TextSpan(
                              text: '  (10 max)',
                              style: AppTextStyle.openSans_light_themeBlack_12)
                        ])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  constraints: BoxConstraints(maxHeight: 108.h),
                  color: AppColors.themeLightGrey,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 80.w,
                          width: 80.w,
                          decoration:
                              BoxDecoration(boxShadow: kElevationToShadow[10]),
                          padding: EdgeInsets.only(
                              top: 16, left: 11, right: 0, bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              print(index);
                            },
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                child: Image.asset(AppImages.addPhoto)),
                          ),
                        );
                      },
                      itemCount: 3,
                      scrollDirection: Axis.horizontal),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 20),
                    child: Text(
                      AppText.detail.toUpperCase(),
                      style: AppTextStyle.openSans_bold_themeGreen_16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  constraints: BoxConstraints(minHeight: 70.h),
                  width: double.infinity,
                  color: AppColors.themeLightGrey,
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    'What are you raffling?',
                    style: AppTextStyle.openSans_regular_textGrey1_14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17),
                  constraints: BoxConstraints(minHeight: 155.h),
                  width: double.infinity,
                  color: AppColors.themeLightGrey,
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    'Describe your item',
                    style: AppTextStyle.openSans_regular_textGrey1_14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17),
                  constraints: BoxConstraints(minHeight: 90.h),
                  width: double.infinity,
                  color: AppColors.themeLightGrey,
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    'Add Tags',
                    style: AppTextStyle.openSans_regular_textGrey1_14,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  color: AppColors.themeLightGrey,
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Product Value',
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '\$ 200',
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(AppImages.info)
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'List Value',
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '\$ 200',
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Ticket Price',
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyle.openSans_regular_textGrey1_14,
                              ),
                              SizedBox(
                                width: 40.w,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$ 1',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Text(
                                      '\$ 5',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Text(
                                      '\$ 20',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Text(
                                      '\$ 50',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Text(
                                      '\$ 100',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No. Of Tickets',
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '\$ 200',
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(AppImages.info)
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Your Earnings ',
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '\$ 200',
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    color: AppColors.themeLightGrey,
                    margin: EdgeInsets.only(top: 17),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Raffle Duration',
                                  style: AppTextStyle
                                      .openSans_regular_textGrey1_14),
                              Text(
                                '${14} Days',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.openSans_bold_themeBlack_14,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 75),
                    child: AppButton(
                      title: 'Preview Listing',
                      isEnable: true,
                      height: 50.h,
                    )),
              ],
            ),
          ),
        ));
  }
}

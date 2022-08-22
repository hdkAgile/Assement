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
              style: AppTextStyle.openSans_regular_themeGreen_16,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 22),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: AppText.photos,
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
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              child: ImageView(image: '')),
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
                      AppText.detail,
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
                    style: AppTextStyle.openSans_regular_themeTextGrey_14,
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
                    style: AppTextStyle.openSans_regular_themeTextGrey_14,
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
                    style: AppTextStyle.openSans_regular_themeTextGrey_14,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

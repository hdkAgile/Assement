import 'package:assement/Utils/enum_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/profile_controller.dart';
import '../Models/DataModels/app_user.dart';
import '../Utils/constants.dart';
import 'Custom/image_view.dart';
import 'Custom/product_grid_cell.dart';
import 'Custom/product_list_cell.dart';
import 'Custom/reviews_list_cell.dart';

class ProfileView extends StatelessWidget {
  int id = 0;

  ProfileView({Key? key, required this.id}) : super(key: key);

  Widget buildSegment(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(text, style: style),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController(
        offset: 0, limit: 10, id: id, userType: UserType.other));
    controller.getUserProfile();
    return Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColors.themeWhite,
          title: Text(AppText.profile,
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
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Visibility(
                    visible: controller.groupValue.value != 2,
                    child: Obx(
                      () => Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 34.h,
                                width: 34.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3.r),
                                      bottomLeft: Radius.circular(3.r)),
                                  color: controller.selectedIndex.value == 0
                                      ? AppColors.themeGreen
                                      : AppColors.themeTabColor,
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      controller.changeSelectedIndex(0);
                                    },
                                    icon: Image.asset(
                                        controller.selectedIndex.value == 0
                                            ? AppImages.gridActive
                                            : AppImages.grid))),
                            Container(
                                height: 34.h,
                                width: 34.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(3.r),
                                      bottomRight: Radius.circular(3.r)),
                                  color: controller.selectedIndex.value == 1
                                      ? AppColors.themeGreen
                                      : AppColors.themeTabColor,
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      controller.changeSelectedIndex(1);
                                    },
                                    icon: Image.asset(
                                        controller.selectedIndex.value == 1
                                            ? AppImages.listActive
                                            : AppImages.list)))
                          ]),
                    )))
          ],
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: Obx(() => SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.0, vertical: 20.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(55.r),
                            child: Container(
                              child: ImageView(
                                image:
                                    controller.currentUser?.value?.image ?? '',
                                imageType: controller.currentUser?.value?.image
                                            .isNotEmpty ??
                                        false
                                    ? ImageType.networkImage
                                    : ImageType.asset,
                              ),
                              height: 110.h,
                              width: 110.h,
                            ),
                          ),
                          SizedBox(width: 47.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: controller.currentUser?.value
                                        ?.firstName?.isNotEmpty ??
                                    false,
                                child: Text(
                                  controller.currentUser?.value?.firstName ??
                                      '',
                                  style: AppTextStyle
                                      .openSans_regular_themeBlack_24,
                                ),
                              ),
                              Visibility(
                                visible: controller.currentUser?.value?.lastName
                                        ?.isNotEmpty ??
                                    false,
                                child: Text(
                                    controller.currentUser?.value?.lastName ??
                                        '',
                                    style: AppTextStyle
                                        .openSans_bold_themeBlack_26),
                              ),
                              Text(
                                'Tampa, FL',
                                style: AppTextStyle.openSans_regular_black_15,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppImages.starFillSmall,
                                    height: 10.w,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 5.h),
                                  Image.asset(
                                    AppImages.starFillSmall,
                                    height: 10.w,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 5.h),
                                  Image.asset(
                                    AppImages.starFillSmall,
                                    height: 10.w,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 5.h),
                                  Image.asset(
                                    AppImages.starFillSmall,
                                    height: 10.w,
                                    width: 10.w,
                                  ),
                                  SizedBox(width: 5.h),
                                  Image.asset(
                                    AppImages.starFillSmall,
                                    height: 10.w,
                                    width: 10.w,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: CupertinoSegmentedControl(
                            padding: EdgeInsets.all(8.0),
                            borderColor: AppColors.themeTabColor,
                            groupValue: controller.groupValue.value,
                            unselectedColor: AppColors.themeTabColor,
                            selectedColor: AppColors.themeWhite,
                            children: {
                              0: buildSegment(
                                  AppText.raffle,
                                  controller.groupValue.value == 0
                                      ? AppTextStyle.openSans_semibold_black_12
                                      : AppTextStyle
                                          .openSans_regular_themeBlack_12),
                              1: buildSegment(
                                  AppText.sold,
                                  controller.groupValue.value == 1
                                      ? AppTextStyle.openSans_semibold_black_12
                                      : AppTextStyle
                                          .openSans_regular_themeBlack_12),
                              2: buildSegment(
                                  AppText.reviews,
                                  controller.groupValue.value == 2
                                      ? AppTextStyle.openSans_semibold_black_12
                                      : AppTextStyle
                                          .openSans_regular_themeBlack_12)
                            },
                            onValueChanged: (index) {
                              final id = index as int;
                              controller.changeGroupIndex(id);
                              controller.changeSelectedIndex(
                                  controller.selectedIndex.value);
                            }),
                      ),
                    ),
                    SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Obx(() => controller.groupValue.value == 2
                          ? Container(
                              padding: EdgeInsets.all(8.0),
                              child: controller.userReviewList.isNotEmpty
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return ReviewListCell(
                                            reviewList: controller
                                                .userReviewList[index]);
                                      },
                                      itemCount:
                                          controller.userReviewList.length)
                                  : Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: Center(
                                        child: Text("No Reviews available",
                                            style: AppTextStyle
                                                .openSans_bold_themeBlack_16),
                                      ),
                                    ))
                          : controller.selectedIndex.value == 0
                              ? GridView.builder(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.userRaffleList.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 144 / 208,
                                    crossAxisSpacing: 25.w,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Center(
                                        child: Container(
                                      margin: EdgeInsets.only(
                                          top: 8, left: 8, bottom: 8, right: 8),
                                      padding:
                                          EdgeInsets.only(top: 8, bottom: 8),
                                      child: ProductGridCell(
                                          raffale: controller
                                              .userRaffleList.value[index]),
                                    ));
                                  })
                              : Container(
                                  // height: 210.sh,
                                  padding: EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return ProductListCell(
                                            raffale: controller
                                                .userRaffleList[index]);
                                      },
                                      itemCount:
                                          controller.userRaffleList.length),
                                )),
                    ),
                    // SizedBox(height: 16.0.h),
                  ],
                ),
              )),
        ));
  }
}

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

class ProfileView extends StatefulWidget {
  int selectedIndex = 0;
  int? groupValue = 0;
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void selecteTab(int index) {
    widget.selectedIndex = index;
    setState(() {});
  }

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
    ProfileController controller =
        Get.put(ProfileController(offset: 0, limit: 10));

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
                  visible: widget.groupValue != 2,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        height: 34.h,
                        width: 34.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3.r),
                              bottomLeft: Radius.circular(3.r)),
                          color: widget.selectedIndex == 0
                              ? AppColors.themeGreen
                              : AppColors.themeTabColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              selecteTab(0);
                            },
                            icon: Image.asset(widget.selectedIndex == 0
                                ? AppImages.gridActive
                                : AppImages.grid))),
                    Container(
                        height: 34.h,
                        width: 34.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(3.r),
                              bottomRight: Radius.circular(3.r)),
                          color: widget.selectedIndex == 1
                              ? AppColors.themeGreen
                              : AppColors.themeTabColor,
                        ),
                        child: IconButton(
                            onPressed: () {
                              selecteTab(1);
                            },
                            icon: Image.asset(widget.selectedIndex == 1
                                ? AppImages.listActive
                                : AppImages.list)))
                  ]),
                ))
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
          child: TextButton(
              onPressed: () {
                controller.logout();
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.themeGreen,
                    borderRadius: BorderRadius.circular(25.r)),
                child: Center(
                  child: Text(
                    AppText.logout,
                    style: AppTextStyle.openSans_bold_themeWhite_17,
                  ),
                ),
              )),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(55.r),
                        child: Container(
                          child: ImageView(
                            image: sharedUser.user.image,
                            imageType: ImageType.networkImage,
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
                            visible: sharedUser.user.firstName.isNotEmpty,
                            child: Text(
                              sharedUser.user.firstName,
                              style:
                                  AppTextStyle.openSans_regular_themeBlack_24,
                            ),
                          ),
                          Visibility(
                            visible: sharedUser.user.lastName.isNotEmpty,
                            child: Text(
                              sharedUser.user.lastName,
                              style: AppTextStyle.openSans_bold_themeBlack_26,
                            ),
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
                        groupValue: widget.groupValue,
                        unselectedColor: AppColors.themeTabColor,
                        selectedColor: AppColors.themeWhite,
                        children: {
                          0: buildSegment(
                              AppText.raffle,
                              widget.groupValue == 0
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle
                                      .openSans_regular_themeBlack_12),
                          1: buildSegment(
                              AppText.sold,
                              widget.groupValue == 1
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle
                                      .openSans_regular_themeBlack_12),
                          2: buildSegment(
                              AppText.reviews,
                              widget.groupValue == 2
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle.openSans_regular_themeBlack_12)
                        },
                        onValueChanged: (index) {
                          setState(() {
                            widget.groupValue = index as int;
                            widget.selectedIndex = widget.selectedIndex;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 0.0),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Obx(() => widget.groupValue == 2
                      ? Container(
                          padding: EdgeInsets.all(8.0),
                          child: controller.userReviewList.isNotEmpty
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ReviewListCell(
                                        reviewList:
                                            controller.userReviewList[index]);
                                  },
                                  itemCount: controller.userReviewList.length)
                              : Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Center(
                                    child: Text("No Reviews available",
                                        style: AppTextStyle
                                            .openSans_bold_themeBlack_16),
                                  ),
                                ))
                      : widget.selectedIndex == 0
                          ? GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
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
                                        raffale:
                                            controller.userRaffleList[index]);
                                  },
                                  itemCount: controller.userRaffleList.length),
                            )),
                ),
                // SizedBox(height: 16.0.h),
              ],
            ),
          ),
        ));
  }
}

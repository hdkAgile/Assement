import 'dart:ffi';

import 'package:assement/Views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../Controllers/home_controller.dart';
import '../Utils/constants.dart';
import 'Custom/image_view.dart';
import 'Custom/product_grid_cell.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController controller = Get.find<HomeController>();

  List<String> categories = [
    AppImages.category1,
    AppImages.category2,
    AppImages.category3,
    AppImages.category4,
    AppImages.category5,
    AppImages.category6,
    AppImages.category7
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.themeWhite,
          appBar: AppBar(
            backgroundColor: AppColors.themeWhite,
            elevation: 0.5,
            title: Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 35.h,
                          padding: EdgeInsets.only(left: 0.0),
                          decoration: BoxDecoration(
                              color: AppColors.themeLightTextGrey,
                              border: Border.all(
                                  color: AppColors.themeLightTextGrey),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Container(
                                  height: 10.w,
                                  width: 10.w,
                                  child: Image.asset(AppImages.search),
                                ),
                                border: InputBorder.none,
                                hintText: AppText.searchText,
                                hintStyle:
                                    AppTextStyle.openSans_semibold_textGrey_14),
                          ),
                        ),
                      ),
                      SizedBox(width: 22.w),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfileView());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Container(
                              height: 30.h,
                              width: 30.h,
                              child: ImageView(image: controller.user.image)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
              top: true,
              bottom: true,
              child: Obx(() => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                          color: AppColors.themeGreen))
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Container(
                                height: 0.2.sh,
                                width: double.infinity,
                                // color: AppColors.themeWhite,
                                child: CarouselSlider(
                                  items: controller.imageSiders,
                                  carouselController: CarouselController(),
                                  options: CarouselOptions(
                                      viewportFraction: 0.85,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      initialPage: controller.pageIndex.value,
                                      onPageChanged: (index, reason) {
                                        controller.changePageIndex(index);
                                      }),
                                ),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Visibility(
                            visible: controller.imageSiders.length > 1,
                            child: Stack(
                              children: [
                                Container(
                                  width: controller.indicatorWidth,
                                  height: 5.0,
                                  color: AppColors.themeLightGrey,
                                ),
                                Container(
                                  width: (controller.indicatorWidth /
                                          controller.imageSiders.length) *
                                      (controller.pageIndex.value + 1),
                                  height: 5.0,
                                  color: AppColors.themeGreen,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppText.winnerCircle,
                                      style: AppTextStyle
                                          .openSans_extrabold_themeBlack_16,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppText.seeMore,
                                              style: AppTextStyle
                                                  .openSans_semibold_textGrey_14,
                                            ),
                                            SizedBox(
                                              width: 8.0.w,
                                            ),
                                            Image.asset(AppImages.rightArrow)
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.h,
                              ),
                              Container(
                                height: 145.h,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 8, top: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    AppColors.themeLightGrey),
                                            boxShadow: kElevationToShadow[6]),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: ImageView(
                                            height: 145.h,
                                            width: 145.w,
                                            image: controller.winners[index]
                                                    .images?[0] ??
                                                '',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: controller.winners.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Visibility(
                              visible: controller.endingSoon.isNotEmpty,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppText.endingSoon,
                                          style: AppTextStyle
                                              .openSans_extrabold_themeBlack_16,
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppText.seeMore,
                                                  style: AppTextStyle
                                                      .openSans_semibold_textGrey_14,
                                                ),
                                                SizedBox(
                                                  width: 8.0.w,
                                                ),
                                                Image.asset(
                                                    AppImages.rightArrow)
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                  Container(
                                    height: 220.h,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: EdgeInsets.only(
                                                left: 16,
                                                right: 8,
                                                top: 8,
                                                bottom: 8),
                                            child: AspectRatio(
                                              aspectRatio: 144 / 208,
                                              child: ProductGridCell(
                                                  image: controller
                                                          .endingSoon[index]
                                                          .images?[0] ??
                                                      '',
                                                  title: controller
                                                          .endingSoon[index]
                                                          .title ??
                                                      '',
                                                  userId: controller
                                                          .endingSoon[index]
                                                          .id ??
                                                      0,
                                                  raffleId: controller
                                                          .endingSoon[index]
                                                          .id ??
                                                      0,
                                                  price: controller
                                                      .endingSoon[index].price
                                                      .toString()),
                                            ));
                                      },
                                      itemCount:
                                          controller.latestRaffles.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Visibility(
                            visible: controller.latestRaffles.isNotEmpty,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppText.recentAdded,
                                        style: AppTextStyle
                                            .openSans_extrabold_themeBlack_16,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppText.seeMore,
                                                style: AppTextStyle
                                                    .openSans_semibold_textGrey_14,
                                              ),
                                              SizedBox(
                                                width: 8.0.w,
                                              ),
                                              Image.asset(AppImages.rightArrow)
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.h,
                                ),
                                Container(
                                  height: 220.h,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: EdgeInsets.only(
                                              left: 16,
                                              right: 8,
                                              top: 8,
                                              bottom: 8),
                                          child: AspectRatio(
                                            aspectRatio: 144 / 208,
                                            child: ProductGridCell(
                                                image: controller
                                                        .latestRaffles[index]
                                                        .images?[0] ??
                                                    '',
                                                title: controller
                                                        .latestRaffles[index]
                                                        .title ??
                                                    '',
                                                userId: controller
                                                        .latestRaffles[index]
                                                        .id ??
                                                    0,
                                                raffleId: controller
                                                        .latestRaffles[index]
                                                        .id ??
                                                    0,
                                                price: controller
                                                    .latestRaffles[index].price
                                                    .toString()),
                                          ));
                                    },
                                    itemCount: controller.latestRaffles.length,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppText.categories,
                                      style: AppTextStyle
                                          .openSans_extrabold_themeBlack_16,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 0.h,
                              ),
                              Container(
                                height: 210.h,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            left: 16,
                                            right: 8,
                                            top: 8,
                                            bottom: 8),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 105.h,
                                              width: 105.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        105.r),
                                                child: Image.network(controller
                                                        .categories[index]
                                                        .image ??
                                                    ''),
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            Text(
                                              controller
                                                      .categories[index].name ??
                                                  '',
                                              style: AppTextStyle
                                                  .openSans_bold_themeTextGrey_12,
                                            )
                                          ],
                                        ));
                                  },
                                  itemCount: controller.categories.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )))),
    );
  }
}

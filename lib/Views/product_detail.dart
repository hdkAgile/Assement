import 'package:assement/Bindings/check_out_binding.dart';
import 'package:assement/Controllers/favourite_controller.dart';
import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/check_out_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/product_detail_controller.dart';
import '../Models/DataModels/product_detail_models.dart';
import '../Utils/constants.dart';
import 'Custom/image_view.dart';

class ProductDetail extends StatelessWidget {
  int userId;
  int raffleId;
  ProductDetail({Key? key, required this.userId, required this.raffleId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailController productDetailController =
        Get.put(ProductDetailController(id: raffleId));
    FavoriteController controller = Get.find<FavoriteController>();
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        backgroundColor: AppColors.themeWhite,
        elevation: 0.5,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {}, icon: Image.asset(AppImages.more_horiz)),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(AppImages.backArrow)),
        title: Obx(() => Text(
              productDetailController.productDetailData.value.title ??
                  "Product Detail",
              style: AppTextStyle.openSans_semibold_themeBlack_15,
            )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
          child: AppButton(
              height: 50.h,
              width: double.infinity,
              title: 'Enter Now',
              onPressed: () {
                Get.to(CheckOutView(), binding: CheckOutBinding());
              },
              isEnable: true),
        ),
      ),
      body: SafeArea(
          child: Obx(
        () => productDetailController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(color: AppColors.themeGreen))
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Container(
                          height: 0.2.sh,
                          width: double.infinity,
                          color: AppColors.themeWhite,
                          child: CarouselSlider(
                            items: productDetailController.imageSiders,
                            carouselController: CarouselController(),
                            options: CarouselOptions(
                                viewportFraction: 0.85,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.horizontal,
                                autoPlay: false,
                                initialPage:
                                    productDetailController.pageIndex.value,
                                onPageChanged: (index, reason) {
                                  final pageIndex = index;
                                  productDetailController
                                      .changePageIndex(pageIndex);
                                }),
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Visibility(
                      visible: productDetailController.imageSiders.length > 1,
                      child: Stack(
                        children: [
                          Container(
                            width: productDetailController.indicatorWidth,
                            height: 5.0,
                            color: AppColors.themeLightGrey,
                          ),
                          Container(
                            width: (productDetailController.indicatorWidth /
                                    productDetailController
                                        .imageSiders.length) *
                                (productDetailController.pageIndex.value + 1),
                            height: 5.0,
                            color: AppColors.themeGreen,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 65.h),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productDetailController
                                      .productDetailData.value.title ??
                                  "Volvo S  90",
                              style:
                                  AppTextStyle.openSans_extraBold_themeBlack_22,
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.favouriteUnfavouriteRaffale(
                                      id: productDetailController
                                              .productDetailData.value.id ??
                                          0,
                                      raffleFavourite: productDetailController
                                              .productDetailData
                                              .value
                                              .favourite
                                              .isFavourite
                                          ? RaffleFavourite.unFavourite
                                          : RaffleFavourite.favourite,
                                      context: context);
                                },
                                icon: Image.asset(productDetailController
                                    .productDetailData
                                    .value
                                    .favourite
                                    .imagePath)),
                          ],
                        )),
                    SizedBox(height: 10.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImages.profileTabActiveIcon,
                                  height: 14.h,
                                  width: 15.w,
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                Text(
                                    "\$ ${productDetailController.productDetailData.value.ticketPrice}",
                                    style: AppTextStyle
                                        .openSans_bold_themeBlack_25)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 19.h,
                                  width: 19.h,
                                  child: ClipRRect(
                                    child: ImageView(
                                      image: productDetailController
                                              .productDetailData
                                              .value
                                              .user
                                              ?.image ??
                                          '',
                                      imageType: ImageType.networkImage,
                                    ),
                                    borderRadius: BorderRadius.circular(19.r),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  productDetailController
                                          .productDetailData.value.user?.name ??
                                      "John Smith",
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyle
                                      .openSans_regular_themeBlack_10,
                                )
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 32.h),
                    Visibility(
                      visible: productDetailController
                              .productDetailData.value.condition?.isNotEmpty ??
                          false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Conditions".toUpperCase(),
                                  style:
                                      AppTextStyle.openSans_bold_themeGreen_12,
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: double.infinity,
                            color: AppColors.themeLightGrey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 16.h),
                            child: Text(
                              productDetailController
                                      .productDetailData.value.condition ??
                                  "Like New",
                              style: AppTextStyle.openSans_bold_themeBlack_14,
                            ),
                          ),
                          SizedBox(height: 28.h),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: productDetailController
                                .productDetailData.value.details?.isNotEmpty ??
                            false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "About".toUpperCase(),
                                    style: AppTextStyle
                                        .openSans_bold_themeGreen_12,
                                  )),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              width: double.infinity,
                              color: AppColors.themeLightGrey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 16.h),
                              child: Text(
                                productDetailController
                                        .productDetailData.value.details ??
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua. Ut enim ad minim veniam, quis\n nostrud exercitation ullamco laboris nisi ut aliquip ex \nea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                                textAlign: TextAlign.justify,
                                maxLines: null,
                              ),
                            ),
                            SizedBox(height: 28.h),
                          ],
                        )),
                    Visibility(
                        visible: productDetailController
                                .productDetailData.value.tag?.isNotEmpty ??
                            false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tags".toUpperCase(),
                                    style: AppTextStyle
                                        .openSans_bold_themeGreen_12,
                                  )),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              width: double.infinity,
                              color: AppColors.themeLightGrey,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 16.h),
                              child: Text(
                                productDetailController
                                        .productDetailData.value.tag ??
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua. Ut enim ad minim veniam, quis\n nostrud exercitation ullamco laboris nisi ut aliquip ex \nea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: 17.h),
                          ],
                        )),
                  ],
                ),
              ),
      )),
    );
  }
}

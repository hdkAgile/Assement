import 'package:assement/Bindings/product_detail_binding.dart';
import 'package:assement/Controllers/favourite_controller.dart';
import 'package:assement/Controllers/search_controller.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Models/DataModels/raffale_list.dart';
import '../../Utils/constants.dart';
import '../product_detail.dart';
import 'image_view.dart';

class ProductListCell extends StatelessWidget {
  Raffale? raffale;

  ProductListCell({this.raffale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    SearchController searchController = Get.find<SearchController>();
    return GestureDetector(
        onTap: () {
          Get.toNamed(ScreenRoutesConstant.productDetail, arguments: {
            'id': raffale?.id,
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.themeWhite,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: kElevationToShadow[8]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(
                            20.r,
                          ),
                          topLeft: Radius.circular(
                            10.r,
                          ),
                          topRight: Radius.circular(
                            10.r,
                          ),
                          bottomLeft: Radius.circular(10.r)),
                      child: Container(
                          width: 144.w,
                          height: 125.h,
                          child: ImageView(
                              image: (raffale!.images!.isNotEmpty
                                  ? raffale!.images![0]
                                  : ''),
                              imageType: ImageType.networkImage,
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        width: 27.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: AppColors.themeWhite,
                            border:
                                Border.all(color: AppColors.themeBorderGrey),
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.themeBorderGrey,
                                  blurRadius: 6.sp,
                                  spreadRadius: 3.r)
                            ]),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "23",
                                style: AppTextStyle.openSans_bold_themeBlack_10,
                              ),
                              Divider(
                                  height: 0.0, color: AppColors.themeDiverGrey),
                              Text(
                                "23",
                                style: AppTextStyle.openSans_bold_themeBlack_10,
                              ),
                              Image.asset(
                                AppImages.profileTabActiveIcon,
                                height: 13,
                                width: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          raffale?.title ?? AppText.productName,
                          style: AppTextStyle.openSans_bold_darkGrey_14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8.h)),
                        InkWell(
                          onTap: () {
                            Get.to(() => ProfileView(
                                  id: raffale?.user?.id ?? 0,
                                ));
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                child: ImageView(
                                    image: raffale?.user?.image ?? '',
                                    imageType: ImageType.networkImage,
                                    height: 19.w,
                                    width: 19.w),
                                borderRadius: BorderRadius.circular(19.r),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                raffale?.user?.name ?? 'John Smith',
                                style:
                                    AppTextStyle.openSans_regular_themeBlack_12,
                              )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8.h)),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${raffale?.price ?? AppText.amount}',
                                style: AppTextStyle.openSans_bold_themeBlack_20,
                              ),
                              InkWell(
                                onTap: () {
                                  if (raffale != null) {
                                    controller.favouriteUnfavouriteRaffale(
                                        id: raffale?.id ?? 0,
                                        raffleFavourite:
                                            raffale?.favourite.isFavourite ??
                                                    false
                                                ? RaffleFavourite.unFavourite
                                                : RaffleFavourite.favourite,
                                        context: context);
                                  }
                                },
                                child: Image.asset(
                                    raffale?.favourite.imagePath ?? ''),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

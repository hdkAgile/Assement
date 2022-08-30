import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/constants.dart';
import 'image_view.dart';

class Product extends StatelessWidget {
  Product(
      {required this.image,
      required this.productName,
      required this.productPrice,
      Key? key})
      : super(key: key);

  String image = '';
  String productName = '';
  int productPrice = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 208.h,
        width: 144.w,
        decoration: BoxDecoration(
            color: AppColors.themeWhite,
            border: Border.all(color: AppColors.themeLightGrey),
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: kElevationToShadow[3]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              20.r,
                            ),
                            topLeft: Radius.circular(
                              10.r,
                            ),
                            topRight: Radius.circular(
                              10.r,
                            )),
                        child: ImageView(
                            image: image,
                            imageType: ImageType.networkImage,
                            width: 144.w,
                            height: 125.h,
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 8,
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
                      ))
                ]),
                SizedBox(
                  height: 9.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    productName,
                    textAlign: TextAlign.left,
                    style: AppTextStyle.openSans_bold_themeDarkGrey_12,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                productPrice.toString(),
                textAlign: TextAlign.left,
                style: AppTextStyle.openSans_bold_themeBlack_18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

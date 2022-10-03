import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Models/DataModels/raffale_list.dart';
import '../../Utils/constants.dart';
import '../product_detail.dart';
import 'image_view.dart';

class ProductGridCell extends StatelessWidget {
  Raffale? raffale;

  ProductGridCell({required this.raffale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ScreenRoutesConstant.productDetail,
            arguments: {'id': raffale?.id});
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.themeWhite,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: kElevationToShadow[8]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
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
                        )),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ImageView(
                        image: raffale?.images?.isNotEmpty ?? false
                            ? raffale?.images?.first ?? ''
                            : '',
                        imageType: ImageType.networkImage,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                raffale?.title ?? '',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.openSans_bold_themeDarkGrey_12,
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "\$ ${raffale?.price ?? 0}",
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

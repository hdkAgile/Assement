import 'package:assement/Bindings/wallet_binding.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/location.dart';
import 'package:assement/Views/my_review_view.dart';
import 'package:assement/Views/my_wallet_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controllers/profile_controller.dart';
import '../Models/DataModels/app_user.dart';
import 'Custom/image_view.dart';

class CurrentUserProfile extends StatelessWidget {
  CurrentUserProfile({Key? key}) : super(key: key);

  ProfileController controller = Get.put(ProfileController(
      offset: 0, limit: 10, id: 0, userType: UserType.current));

  @override
  Widget build(BuildContext context) {
    controller.getUserProfile();
    controller.getAddress();
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColors.themeWhite,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                height: 17.h,
                width: 22.w,
                child:
                    Image.asset(AppImages.close, color: AppColors.themeBlack))),
      ),
      body: SafeArea(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                            visible: sharedUser.user.firstName.isNotEmpty,
                            child: Text(sharedUser.user.firstName,
                                style: AppTextStyle
                                    .openSans_regular_themeBlack_24)),
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
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: InkWell(
                  onTap: () {
                    Get.to(() => MyWalletView(), binding: WalletBinding());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImageView(
                              image: AppImages.myWallet,
                              imageType: ImageType.asset),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text("My Wallet",
                              style:
                                  AppTextStyle.openSans_regular_themeBlack_14)
                        ],
                      ),
                      ImageView(
                        image: AppImages.blackArrowRight,
                        imageType: ImageType.asset,
                        color: AppColors.themeTextGrey,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => MyReviewView());
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: AppColors.themeLightGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImageView(
                              image: AppImages.myReview,
                              imageType: ImageType.asset),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text("My Reviews",
                              style:
                                  AppTextStyle.openSans_regular_themeBlack_14)
                        ],
                      ),
                      ImageView(
                        image: AppImages.blackArrowRight,
                        imageType: ImageType.asset,
                        color: AppColors.themeTextGrey,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 16.w),
                color: AppColors.themeWhite,
                child: Text(
                  "Profile".toUpperCase(),
                  style: AppTextStyle.openSans_bold_themeGreen_14,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.name, imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Name",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${controller.user.fullName}',
                          style: AppTextStyle.openSans_regular_themeDarkGrey_14,
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        ImageView(
                          image: AppImages.blackArrowRight,
                          imageType: ImageType.asset,
                          color: AppColors.themeTextGrey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.email, imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Email",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${controller.user.email}',
                          style: AppTextStyle.openSans_regular_themeDarkGrey_14,
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        ImageView(
                          image: AppImages.blackArrowRight,
                          imageType: ImageType.asset,
                          color: AppColors.themeTextGrey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: InkWell(
                  onTap: () {
                    Get.to(() => LocationView())
                        ?.then((value) => controller.getAddress());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImageView(
                              image: AppImages.location,
                              imageType: ImageType.asset),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text("Location",
                              style:
                                  AppTextStyle.openSans_regular_themeBlack_14)
                        ],
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.address.value?.city ?? '',
                              style: AppTextStyle
                                  .openSans_regular_themeDarkGrey_14,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          ImageView(
                            image: AppImages.blackArrowRight,
                            imageType: ImageType.asset,
                            color: AppColors.themeTextGrey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.password,
                            imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Password",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    ImageView(
                      image: AppImages.blackArrowRight,
                      imageType: ImageType.asset,
                      color: AppColors.themeTextGrey,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.notifications,
                            imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Notifications",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    ImageView(
                      image: AppImages.blackArrowRight,
                      imageType: ImageType.asset,
                      color: AppColors.themeTextGrey,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.only(left: 16.w),
                color: AppColors.themeWhite,
                child: Text(
                  "Support".toUpperCase(),
                  style: AppTextStyle.openSans_bold_themeGreen_14,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.privacyPolicy,
                            imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Privacy Policy",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    ImageView(
                      image: AppImages.blackArrowRight,
                      imageType: ImageType.asset,
                      color: AppColors.themeTextGrey,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.termOfUse,
                            imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Terms of Use",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    ImageView(
                      image: AppImages.blackArrowRight,
                      imageType: ImageType.asset,
                      color: AppColors.themeTextGrey,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                color: AppColors.themeLightGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ImageView(
                            image: AppImages.contactUs,
                            imageType: ImageType.asset),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text("Contact Us",
                            style: AppTextStyle.openSans_regular_themeBlack_14)
                      ],
                    ),
                    ImageView(
                      image: AppImages.blackArrowRight,
                      imageType: ImageType.asset,
                      color: AppColors.themeTextGrey,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: AppButton(
                  title: AppText.logout,
                  isEnable: true,
                  onPressed: () {
                    controller.logout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/DataModels/user_reviews.dart';
import '../../Utils/constants.dart';

class ReviewListCell extends StatelessWidget {
  ReviewList reviewList;
  ReviewListCell({required this.reviewList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                      'https://content.fortune.com/wp-content/uploads/2022/05/GettyImages-1395062611.jpg'),
                ),
              ],
            ),
            SizedBox(width: 17.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewList.firstName! + reviewList.lastName!,
                  style: AppTextStyle.openSans_bold_themeBlack_12,
                ),
                SizedBox(
                  height: 8.h,
                ),
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
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 0.72.sw,
                  padding: EdgeInsets.only(right: 16.0),
                  child: Text(
                    reviewList.description ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: AppTextStyle.openSans_regular_themeBlack_10,
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

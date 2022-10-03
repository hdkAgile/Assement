import 'package:assement/Models/DataModels/app_user.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageListCell extends StatelessWidget {
  MessageListCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22.r),
          child: ImageView(
              image: sharedUser.user.image,
              imageType: ImageType.networkImage,
              height: 44.w,
              width: 44.w),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Michael Thomas",
                style: AppTextStyle.openSans_bold_themeBlack_14,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              "Lorem ipsum dolor sit amet, sectetur adipiscing elit, ",
              maxLines: 2,
              style: AppTextStyle.openSans_regular_themeTextGrey_8,
            )
          ],
        ),
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.themeGreen),
        )
      ],
    );
  }
}

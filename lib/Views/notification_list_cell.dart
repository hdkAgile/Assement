import 'package:assement/Models/DataModels/app_user.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationListCell extends StatelessWidget {
  const NotificationListCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.r),
                topRight: Radius.circular(4.r),
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r)),
            child: ImageView(
              height: 34.w,
              width: 34.w,
              imageType: ImageType.networkImage,
              image: sharedUser.user.image,
            )),
        SizedBox(
          width: 16,
        ),
        Text(
          'Congratulations on your win. Leave a review now!',
          style: AppTextStyle.openSans_regular_themeBlack_10,
          maxLines: 2,
        )
      ],
    );
  }
}

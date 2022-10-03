import 'package:assement/Bindings/profile_binding.dart';
import 'package:assement/Controllers/message_notification_controller.dart';
import 'package:assement/Models/DataModels/app_user.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Views/Custom/image_view.dart';
import 'package:assement/Views/message_list_cell.dart';
import 'package:assement/Views/notification_list_cell.dart';
import 'package:assement/Views/user_profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MessageNotificationView extends StatelessWidget {
  MessageNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageNotificationController controller =
        Get.find<MessageNotificationController>();
    return Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
            backgroundColor: AppColors.themeWhite,
            elevation: 0.5,
            centerTitle: false,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(AppText.inbox,
                          style: AppTextStyle.openSans_semibold_themeBlack_15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => CurrentUserProfile(),
                          binding: ProfileBinding());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13.r),
                        child: Container(
                          height: 30.h,
                          width: 30.h,
                          child: ImageView(
                              image: sharedUser.user.image,
                              imageType: ImageType.networkImage),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 40),
              child: Padding(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 8),
                  child: Obx(
                    () => Container(
                      decoration: BoxDecoration(
                          color: AppColors.themeTabColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CupertinoSegmentedControl(
                        padding: EdgeInsets.all(5),
                        borderColor: AppColors.themeTabColor,
                        groupValue: controller.groupValue.value,
                        unselectedColor: AppColors.themeTabColor,
                        selectedColor: AppColors.themeWhite,
                        children: {
                          0: controller.buildSegment(
                            text: AppText.messages,
                            style: controller.groupValue.value == 0
                                ? AppTextStyle.openSans_semibold_black_12
                                : AppTextStyle.openSans_regular_themeBlack_12,
                          ),
                          1: controller.buildSegment(
                              text: AppText.notifications,
                              style: controller.groupValue.value == 1
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle.openSans_regular_themeBlack_12)
                        },
                        onValueChanged: (index) {
                          int selectedIndex = index as int;
                          controller.changeGroupIndex(selectedIndex);
                        },
                      ),
                    ),
                  )),
            )),
        body: SafeArea(
            child: Obx(() => controller.groupValue.value == 0
                ? Container(
                    constraints: BoxConstraints(minHeight: 100.h),
                    child: ListView.builder(
                        itemCount: controller.notifications.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: MessageListCell(),
                          );
                        }),
                  )
                : Container(
                    constraints: BoxConstraints(minHeight: 100.h),
                    child: ListView.builder(
                        itemCount: controller.notifications.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: NotificationListCell(),
                          );
                        }),
                  ))));
  }
}

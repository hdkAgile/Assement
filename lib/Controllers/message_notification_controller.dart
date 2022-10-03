import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Models/DataModels/notification_list.dart';
import 'package:assement/Models/DataModels/response_model.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Utils/network_manager/remote_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageNotificationController extends GetxController {
  RxInt groupValue = 0.obs;
  RxList notifications = [].obs;

  @override
  void onInit() {
    super.onInit();
    getNotificationList();
  }

  Widget buildSegment({required String text, required TextStyle style}) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        height: 30.h,
        child: Center(child: Text(text, style: style)));
  }

  void changeGroupIndex(int index) {
    groupValue.value = index;
  }

  void getMessages() async {}

  void getNotificationList() async {
    ResponseModel<List<NotificationList>> responseModel =
        await sharedServiceManager.createGetRequest(
            typeOfEndPoint: APIType.notificationList);

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      notifications.value = responseModel.data ?? [];
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }
}

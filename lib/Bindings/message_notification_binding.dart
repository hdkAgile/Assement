import 'package:get/get.dart';

import '../Controllers/message_notification_controller.dart';

class MessageNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageNotificationController());
  }
}

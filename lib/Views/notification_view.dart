import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: AppColors.themeWhite,
        title: Text(AppText.inbox,
            style: AppTextStyle.openSans_semibold_themeBlack_15_),
        actions: [],
      ),
    );
  }
}

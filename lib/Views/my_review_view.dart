import 'package:assement/Controllers/profile_controller.dart';
import 'package:assement/Views/Custom/reviews_list_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';

class MyReviewView extends StatelessWidget {
  MyReviewView({Key? key}) : super(key: key);

  ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    controller.fetchReviewList();
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'My Reviews',
          style: AppTextStyle.openSans_semibold_themeBlack_15,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(AppImages.backArrow)),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: controller.userReviewList.length,
            itemBuilder: (context, index) {
              return ReviewListCell(
                  reviewList: controller.userReviewList.value[index]);
            }),
      ),
    );
  }
}

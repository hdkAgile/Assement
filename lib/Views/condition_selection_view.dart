import 'package:assement/Controllers/add_raafale_controller.dart';
import 'package:assement/Models/DataModels/condition_selection_model.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/constants.dart';
import '../Utils/enum_all.dart';

class ConditionSelectionView extends StatefulWidget {
  ConditionSelectionView({Key? key}) : super(key: key);

  @override
  State<ConditionSelectionView> createState() => _ConditionSelectionViewState();
}

class _ConditionSelectionViewState extends State<ConditionSelectionView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddRaffaleController>();
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColors.themeWhite,
        title: Text(AppText.condition,
            style: AppTextStyle.openSans_bold_themeBlack_14),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
                height: 17.h,
                width: 22.w,
                child: Image.asset(AppImages.backArrow,
                    color: AppColors.themeGreen))),
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.themeLightGrey,
        constraints: BoxConstraints(maxHeight: 180.h),
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.updateSelection(index);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Obx(
                    () => SelectionView(
                        title: controller.items[index].type.title,
                        isSelected: controller.items[index].isSelected),
                  ),
                ),
              );
            },
            itemCount: controller.items.length),
      ),
    );
  }
}

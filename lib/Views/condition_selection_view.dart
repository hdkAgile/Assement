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
  List<ConditionSelectionModel> items = [
    ConditionSelectionModel(type: ConditionType.newInPackage, isSelected: true),
    ConditionSelectionModel(type: ConditionType.lightlyUsed, isSelected: false),
    ConditionSelectionModel(type: ConditionType.used, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
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
        height: 180.h,
        width: double.infinity,
        color: AppColors.themeLightGrey,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (int i = 0; i < items.length; i++) {
                    if (i == index) {
                      items[i].isSelected = true;
                    } else {
                      items[i].isSelected = false;
                    }
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SelectionView(
                      title: items[index].type.title,
                      isSelected: items[index].isSelected),
                ),
              );
            },
            itemCount: items.length),
      ),
    );
  }
}

import 'package:assement/Views/selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controllers/add_raafale_controller.dart';
import '../Utils/constants.dart';

class CategorySelectionView extends StatefulWidget {
  const CategorySelectionView({Key? key}) : super(key: key);

  @override
  State<CategorySelectionView> createState() => _CategorySelectionViewState();
}

class _CategorySelectionViewState extends State<CategorySelectionView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddRaffaleController());
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColors.themeWhite,
        title: Text(AppText.category,
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
        constraints: BoxConstraints(minHeight: 100.h),
        // color: AppColors.themeLightGrey,
        color: AppColors.themeLightGrey,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.updateCategorySelection(index);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
                    child: Obx(
                      () => SelectionView(
                          title:
                              controller.categoryItems[index].category.name ??
                                  '',
                          isSelected:
                              controller.categoryItems[index].isSelected),
                    ),
                  ),
                );
              },
              itemCount: controller.categoryItems.length),
        ),
      ),
    );
  }
}

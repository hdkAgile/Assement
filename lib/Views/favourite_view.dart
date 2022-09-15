import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/favourite_controller.dart';
import '../Utils/constants.dart';
import 'Custom/product_grid_cell.dart';
import 'Custom/product_list_cell.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  Widget buildSegment(String text, TextStyle style) {
    return Container(
      child: Text(text, style: style),
    );
  }

  List<String> items = ['Active', 'Inactive'];

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    void selecteTab(int index) {
      controller.selectedIndex.value = index;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.themeWhite,
          elevation: 0.5,
          title: Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Obx(
                        () => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  height: 34.h,
                                  width: 34.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3.r),
                                        bottomLeft: Radius.circular(3.r)),
                                    color: controller.selectedIndex.value == 0
                                        ? AppColors.themeGreen
                                        : AppColors.themeTabColor,
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        selecteTab(0);
                                      },
                                      icon: Image.asset(
                                          controller.selectedIndex.value == 0
                                              ? AppImages.gridActive
                                              : AppImages.grid))),
                              Container(
                                  height: 34.h,
                                  width: 34.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(3.r),
                                        bottomRight: Radius.circular(3.r)),
                                    color: controller.selectedIndex.value == 1
                                        ? AppColors.themeGreen
                                        : AppColors.themeTabColor,
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        selecteTab(1);
                                      },
                                      icon: Image.asset(
                                          controller.selectedIndex.value == 1
                                              ? AppImages.listActive
                                              : AppImages.list)))
                            ]),
                      )),
                ),
                SizedBox(height: 9.h),
              ],
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 50),
              child: Obx(
                () => Padding(
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 16),
                  child: Container(
                    width: double.infinity,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: CupertinoSegmentedControl(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        borderColor: AppColors.themeTabColor,
                        groupValue: controller.groupValue.value,
                        unselectedColor: AppColors.themeTabColor,
                        selectedColor: AppColors.themeWhite,
                        children: {
                          0: buildSegment(
                              AppText.tickets,
                              controller.groupValue.value == 0
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle
                                      .openSans_regular_themeBlack_12),
                          1: buildSegment(
                              AppText.listings,
                              controller.groupValue.value == 1
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle
                                      .openSans_regular_themeBlack_12),
                          2: buildSegment(
                              AppText.favorites,
                              controller.groupValue.value == 2
                                  ? AppTextStyle.openSans_semibold_black_12
                                  : AppTextStyle.openSans_regular_themeBlack_12)
                        },
                        onValueChanged: (index) {
                          int selectedIndex = index as int;
                          controller.changeGroupIndex(selectedIndex);
                          controller.changeSelectedIndex(
                              controller.selectedIndex.value);
                        }),
                  ),
                ),
              )),
        ),
        backgroundColor: AppColors.themeWhite,
        body: Obx(
          () => SafeArea(
            top: true,
            bottom: true,
            child: controller.isLoading.value
                ? Center(
                    child:
                        CircularProgressIndicator(color: AppColors.themeGreen))
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.themeWhite,
                                  border: Border.all(
                                      color: AppColors.themeLightGrey),
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: kElevationToShadow[2]),
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: DropdownButton<String>(
                                  underline: Container(),
                                  isExpanded: true,
                                  style:
                                      AppTextStyle.openSans_bold_themeBlack_12,
                                  icon: Image.asset(AppImages.dropDownArrow),
                                  value: controller.dropDownValue.value,
                                  alignment: Alignment.topLeft,
                                  items: controller.dropDownItems.value
                                      .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (value) {
                                    controller.dropDownValue.value =
                                        value ?? '';
                                  })),
                        ),
                        SizedBox(height: 8.h),
                        controller.selectedIndex.value == 0
                            ? GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.items.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 144 / 208,
                                  crossAxisSpacing: 25.w,
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  return Center(
                                      child: Container(
                                    margin: EdgeInsets.only(
                                        top: 8, left: 8, bottom: 8, right: 8),
                                    padding: EdgeInsets.only(top: 8, bottom: 8),
                                    child: ProductGridCell(
                                        raffale: controller.items[index]),
                                  ));
                                })
                            : Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.items.length,
                                  itemBuilder: (context, index) {
                                    return ProductListCell(
                                        raffale: controller.items[index]);
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
          ),
        ));
  }
}

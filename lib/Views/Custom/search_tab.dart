import 'package:assement/Views/Custom/product_grid_cell.dart';
import 'package:assement/Views/Custom/product_list_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Controllers/search_controller.dart';
import '../../Utils/constants.dart';
import '../profile_view.dart';
import 'image_view.dart';

class Search extends StatefulWidget {
  int selectedIndex = 0;
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    SearchController searchController =
        Get.put(SearchController(limit: 10, offset: 1));

    void selecteTab(int index) {
      widget.selectedIndex = index;
      setState(() {});
    }

    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        backgroundColor: AppColors.themeWhite,
        elevation: 0.5,
        title: Padding(
          padding: EdgeInsets.only(top: 16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 35.h,
                      padding: EdgeInsets.only(left: 0.0),
                      decoration: BoxDecoration(
                          color: AppColors.themeLightTextGrey,
                          border:
                              Border.all(color: AppColors.themeLightTextGrey),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Container(
                              height: 10.w,
                              width: 10.w,
                              child: Image.asset(AppImages.search),
                            ),
                            border: InputBorder.none,
                            hintText: AppText.searchText,
                            hintStyle:
                                AppTextStyle.openSans_semibold_textGrey_14),
                      ),
                    ),
                  ),
                  SizedBox(width: 22.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProfileView());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                          height: 30.h,
                          width: 30.h,
                          child: ImageView(
                            image: searchController.user.image,
                            imageType: ImageType.networkImage,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
        bottom: PreferredSize(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 34.h,
                          width: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3.r),
                                bottomLeft: Radius.circular(3.r)),
                            color: widget.selectedIndex == 0
                                ? AppColors.themeGreen
                                : AppColors.themeTabColor,
                          ),
                          child: IconButton(
                              onPressed: () {
                                selecteTab(0);
                              },
                              icon: Image.asset(widget.selectedIndex == 0
                                  ? AppImages.gridActive
                                  : AppImages.grid))),
                      Container(
                          height: 34.h,
                          width: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(3.r),
                                bottomRight: Radius.circular(3.r)),
                            color: widget.selectedIndex == 1
                                ? AppColors.themeGreen
                                : AppColors.themeTabColor,
                          ),
                          child: IconButton(
                              onPressed: () {
                                selecteTab(1);
                              },
                              icon: Image.asset(widget.selectedIndex == 1
                                  ? AppImages.listActive
                                  : AppImages.list)))
                    ],
                  ),
                  Container(
                    height: 34.h,
                    width: 34.h,
                    color: AppColors.themeTabColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(AppImages.filterIcon)),
                  )
                ],
              ),
            ),
            preferredSize: Size(double.infinity, 45.h)),
      ),
      body: SafeArea(
          top: true,
          bottom: true,
          child: Obx(() => searchController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(color: AppColors.themeGreen))
              : SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      widget.selectedIndex == 0
                          ? GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: searchController.items.length,
                              shrinkWrap: true,
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
                                      raffale: searchController.items[index]),
                                ));
                              })
                          : Container(
                              padding: EdgeInsets.all(8.0),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: searchController.items.length,
                                itemBuilder: (context, index) {
                                  return ProductListCell(
                                      raffale: searchController.items[index]);
                                },
                              ),
                            )
                    ],
                  ),
                ))),
    );
  }
}

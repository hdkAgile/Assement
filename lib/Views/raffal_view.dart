import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/DataModels/User.dart';
import '../Utils/constants.dart';
import 'Custom/product_grid_cell.dart';

class RaffaleView extends StatefulWidget {
  int selectedIndex = 0;
  int? groupValue = 0;
  RaffaleView({Key? key}) : super(key: key);

  @override
  State<RaffaleView> createState() => _RaffaleViewState();
}

class _RaffaleViewState extends State<RaffaleView> {
  void selecteTab(int index) {
    widget.selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Image.asset(AppImages.backArrow)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: widget.groupValue == 2
                        ? []
                        : [
                            Container(
                                height: 34.h,
                                width: 34.h,
                                color: widget.selectedIndex == 0
                                    ? AppColors.themeGreen
                                    : AppColors.themeTabColor,
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
                                color: widget.selectedIndex == 1
                                    ? AppColors.themeGreen
                                    : AppColors.themeTabColor,
                                child: IconButton(
                                    onPressed: () {
                                      selecteTab(1);
                                    },
                                    icon: Image.asset(widget.selectedIndex == 1
                                        ? AppImages.listActive
                                        : AppImages.list)))
                          ],
                  )
                ],
              ),
            ),
            Divider(
              height: 0.5.h,
              color: AppColors.themeTextGrey,
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 55.r,
                      backgroundImage: NetworkImage(
                          'https://content.fortune.com/wp-content/uploads/2022/05/GettyImages-1395062611.jpg'),
                    ),
                    height: 110.h,
                    width: 110.h,
                  ),
                  SizedBox(width: 47.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John',
                        style: AppTextStyle.openSans_regular_themeBlack_24,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Smith',
                        style: AppTextStyle.openSans_bold_themeBlack_26,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Tampa, FL',
                        style: AppTextStyle.openSans_regular_black_15,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.starFillSmall,
                            height: 10.w,
                            width: 10.w,
                          ),
                          SizedBox(width: 5.h),
                          Image.asset(
                            AppImages.starFillSmall,
                            height: 10.w,
                            width: 10.w,
                          ),
                          SizedBox(width: 5.h),
                          Image.asset(
                            AppImages.starFillSmall,
                            height: 10.w,
                            width: 10.w,
                          ),
                          SizedBox(width: 5.h),
                          Image.asset(
                            AppImages.starFillSmall,
                            height: 10.w,
                            width: 10.w,
                          ),
                          SizedBox(width: 5.h),
                          Image.asset(
                            AppImages.starFillSmall,
                            height: 10.w,
                            width: 10.w,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 8, right: 8),
                child: CupertinoSegmentedControl(
                    padding: EdgeInsets.all(8.0),
                    borderColor: AppColors.themeTabColor,
                    groupValue: widget.groupValue,
                    unselectedColor: AppColors.themeTabColor,
                    selectedColor: AppColors.themeWhite,
                    children: {
                      0: buildSegment(
                          AppText.raffle,
                          widget.groupValue == 0
                              ? AppTextStyle.openSans_semibold_black_12
                              : AppTextStyle.openSans_regular_themeBlack_12),
                      1: buildSegment(
                          AppText.sold,
                          widget.groupValue == 1
                              ? AppTextStyle.openSans_semibold_black_12
                              : AppTextStyle.openSans_regular_themeBlack_12),
                      2: buildSegment(
                          AppText.reviews,
                          widget.groupValue == 2
                              ? AppTextStyle.openSans_semibold_black_12
                              : AppTextStyle.openSans_regular_themeBlack_12)
                    },
                    onValueChanged: (index) {
                      setState(() {
                        widget.groupValue = index as int;
                        widget.selectedIndex = 0;
                      });
                    }),
              ),
            ),
            SizedBox(height: 40.0),
            widget.groupValue == 2
                ? Container(
                    height: 210.sh,
                    padding: EdgeInsets.all(8.0),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Text("data");
                        },
                        itemCount: 10),
                  )
                : widget.selectedIndex == 0
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.5.sw / 208.w,
                            crossAxisCount: 2,
                            mainAxisSpacing: 32.w),
                        itemBuilder: (context, index) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: ProductGridCell(
                                userId: 0,
                                raffleId: 0,
                                price: '100',
                                title: 'ProductName',
                                image: AppImages.johnSmith),
                          ));
                        })
                    : Container(
                        height: 210.sh,
                        padding: EdgeInsets.all(8.0),
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ProductGridCell(
                                  userId: 0,
                                  raffleId: 0,
                                  price: '100',
                                  title: 'ProductName',
                                  image: AppImages.johnSmith);
                            },
                            itemCount: 20),
                      )
          ],
        ),
      ),
    );
  }

  Widget buildSegment(String text, TextStyle style) {
    return Container(
      child: Text(text, style: style),
    );
  }
}

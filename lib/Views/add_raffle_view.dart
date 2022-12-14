import 'package:assement/Controllers/add_raafale_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:assement/Views/category_selection_view.dart';
import 'package:assement/Views/condition_selection_view.dart';
import 'package:assement/Views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/constants.dart';
import 'Custom/image_view.dart';
import 'add_raafle_detail_view.dart';

class AddRaffleView extends StatelessWidget {
  AddRaffleView({Key? key}) : super(key: key);

  AddRaffaleController controller = Get.find<AddRaffaleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppText.detail,
            style: AppTextStyle.openSans_bold_themeBlack_14,
          ),
          leadingWidth: 80.0.w,
          leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(AppText.cancel,
                style: AppTextStyle.openSans_semibold_black_12),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                            text: AppText.photos.toUpperCase(),
                            style: AppTextStyle.openSans_bold_themeGreen_16,
                            children: <TextSpan>[
                          TextSpan(
                              text: '  (10 max)',
                              style: AppTextStyle.openSans_light_themeBlack_12)
                        ])),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  constraints: BoxConstraints(
                      maxHeight: 108.h, minWidth: double.infinity),
                  color: AppColors.themeLightGrey,
                  child: Obx(() => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  print(controller.images.length);
                                  return Container(
                                    height: 80.w,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                        boxShadow: kElevationToShadow[10]),
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        left: 11,
                                        right: 0,
                                        bottom: 16),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r)),
                                        child: ImageView(
                                            height: 80.w,
                                            width: 80.w,
                                            image: controller
                                                .images.value[index].path,
                                            imageType: ImageType.file)),
                                  );
                                },
                                itemCount: controller.images.length,
                                scrollDirection: Axis.horizontal),
                          ),
                          Visibility(
                            visible: !(controller.images.length > 10) ||
                                (controller.images.length == 0),
                            child: InkWell(
                              onTap: () {
                                controller.pickedImage(ImageSource.gallery);
                              },
                              child: Container(
                                height: 80.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    boxShadow: kElevationToShadow[10]),
                                padding: EdgeInsets.only(
                                    top: 16, left: 11, right: 0, bottom: 16),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  child: ImageView(
                                      image: AppImages.addPhoto,
                                      imageType: ImageType.asset,
                                      fit: BoxFit.cover),

                                  // child: index == controller.images.value.length - 1
                                  //     ? Visibility(
                                  //         visible:
                                  //             // !(controller.images.length > 10) ||
                                  //             //     controller.images.length == 1,
                                  //         child: InkWell(
                                  //             onTap: () {
                                  //               controller.pickedImage(
                                  //                   ImageSource.gallery);
                                  //             },
                                  //             child:
                                  //                 Image.asset(AppImages.addPhoto)))
                                  //     : ImageView(
                                  //         image:
                                  //             controller.images.value[index].path)
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, top: 20),
                    child: Text(
                      AppText.detail.toUpperCase(),
                      style: AppTextStyle.openSans_bold_themeGreen_16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  constraints: BoxConstraints(minHeight: 75.h),
                  width: double.infinity,
                  color: AppColors.themeLightGrey,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: AppTextStyle.openSans_regular_textGrey1_14,
                        hintText: 'What are you raffling?'),
                    onChanged: (value) {
                      controller.title.value = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17),
                  constraints: BoxConstraints(minHeight: 155.h),
                  width: double.infinity,
                  color: AppColors.themeLightGrey,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: AppTextStyle.openSans_regular_textGrey1_14,
                        hintText: 'Describe your item'),
                    onChanged: (value) {
                      controller.decribeItem.value = value;
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 17),
                    constraints: BoxConstraints(minHeight: 90.h),
                    width: double.infinity,
                    color: AppColors.themeLightGrey,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: AppTextStyle.openSans_regular_textGrey1_14,
                          hintText: 'Add Tags'),
                      onChanged: (value) {
                        controller.tag.value = value;
                      },
                    )),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ConditionSelectionView());
                  },
                  child: Container(
                    width: double.infinity,
                    color: AppColors.themeLightGrey,
                    margin: EdgeInsets.only(top: 17),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppText.condition,
                          style: AppTextStyle.openSans_bold_themeBlack_14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                controller.selectedConditonType.value.type
                                        .title ??
                                    AppText.condition,
                                style:
                                    AppTextStyle.openSans_regular_textGrey1_14,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Image.asset(AppImages.blackArrowRight),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CategorySelectionView());
                  },
                  child: Container(
                    width: double.infinity,
                    color: AppColors.themeLightGrey,
                    margin: EdgeInsets.only(top: 17),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppText.category,
                          style: AppTextStyle.openSans_bold_themeBlack_14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => Text(
                                controller
                                        .selectedCategory.value.category.name ??
                                    AppText.category,
                                style:
                                    AppTextStyle.openSans_regular_textGrey1_14,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Image.asset(AppImages.blackArrowRight),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  color: AppColors.themeLightGrey,
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Product Value',
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '\$ ${controller.productValue.value}',
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(AppImages.info)
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: Text(
                                    'List Value',
                                    style: AppTextStyle
                                        .openSans_regular_textGrey1_14,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    TextField(
                                        style: AppTextStyle
                                            .openSans_bold_themeBlack_14,
                                        decoration: InputDecoration(
                                            prefix: Text(
                                              '\$ ',
                                              style: AppTextStyle
                                                  .openSans_bold_themeBlack_14,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none)),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          height: 20.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Ticket Price',
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyle.openSans_regular_textGrey1_14,
                              ),
                              Obx(
                                () => ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        controller.priceList[index].title,
                                        style: AppTextStyle
                                            .openSans_bold_themeBlack_14,
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Text("    ");
                                    },
                                    itemCount: controller.priceList.length),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No. Of Tickets',
                                      textAlign: TextAlign.start,
                                      style: AppTextStyle
                                          .openSans_regular_textGrey1_14,
                                    ),
                                    Text(
                                      '200',
                                      textDirection: TextDirection.ltr,
                                      style: AppTextStyle
                                          .openSans_bold_themeBlack_14,
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(AppImages.info)
                            ],
                          )),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      Container(
                          // color: Colors.red,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  child: Text(
                                    'Your Earnings',
                                    style: AppTextStyle
                                        .openSans_regular_textGrey1_14,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    TextField(
                                        style: AppTextStyle
                                            .openSans_bold_themeBlack_14,
                                        decoration: InputDecoration(
                                            prefix: Text(
                                              '\$ ',
                                              style: AppTextStyle
                                                  .openSans_bold_themeBlack_14,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none)),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Divider(height: 0.5, color: AppColors.themeLightGrey1),
                      // SizedBox(
                      //   height: 16.h,
                      // ),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    color: AppColors.themeLightGrey,
                    margin: EdgeInsets.only(top: 17),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Raffle Duration',
                                  style: AppTextStyle
                                      .openSans_regular_textGrey1_14),
                              SizedBox(
                                width: 40.w,
                              ),
                              Text(
                                '${14} Days',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.openSans_bold_themeBlack_14,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 75),
                    child: AppButton(
                      title: 'Preview Listing',
                      isEnable: true,
                      height: 50.h,
                      onPressed: () {
                        Get.to(() => AddRaffleDetailView());
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}

import 'dart:io';

import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Models/DataModels/condition_selection_model.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Views/Custom/image_view.dart';

class AddRaffaleController extends GetxController {
  RxList<String> images = <String>[].obs;
  Rx<ConditionSelectionModel>? selectedConditionModel;
  RxList<Widget> imageSiders = <Widget>[].obs;

  var items = <ConditionSelectionModel>[].obs;
  RxInt pageIndex = 0.obs;

  var indicatorWidth = MediaQuery.of(Get.context!).size.width / 2;

  @override
  void onInit() {
    super.onInit();

    items.value = [
      ConditionSelectionModel(
          type: ConditionType.newInPackage, isSelected: true),
      ConditionSelectionModel(
          type: ConditionType.lightlyUsed, isSelected: false),
      ConditionSelectionModel(type: ConditionType.used, isSelected: false),
    ];

    images.add(AppImages.addPhoto);
  }

  void addRaffale() async {}

  void pickedImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? multipleImages = await picker.pickMultiImage();

      if (multipleImages!.isNotEmpty) {
        // images.addAll(multipleImages);
        // print(images.length);

        if (multipleImages.length <= 10) {
          for (int i = 0; i <= 10; i++) {
            print(multipleImages[i].path);
            images.add(multipleImages[i].path);
          }
        } else {
          AlertManagerController.showSnackBar(
              'Maximum limit reached', '', Position.bottom);
        }
        update();
        setupImageSiders();
      } else {
        AlertManagerController.showSnackBar(
            '', 'Somnethig went wrong', Position.bottom);
      }
    } on PlatformException catch (e) {
      AlertManagerController.showSnackBar(
          'Somnethig went wrong', e.toString(), Position.bottom);
    }
  }

  void changePageIndex(int index) {
    pageIndex.value = index;
  }

  void createRaffale() async {
    Map<String, dynamic> params = {};
    params['title'] = 'New';
    params['quantity'] = 130;
    params['value'] = 100;
    params['price'] = 100;
    params['earning'] = 100;
    params['condition'] = 100;
    params['details'] = '';
    params['tag'] = '';
    params['ticket_price_id'] = 1;
    params['category_id'] = 2;
    params['images'] = images;
  }

  onSelection(int index) {
    for (int i = 0; i < items.length; i++) {
      if (index == i) {
        items.value[i].isSelected = true;
      } else {
        items.value[i].isSelected = false;
      }
    }
    update();
  }

  String? get title {
    if (selectedConditionModel != null) {
      return selectedConditionModel?.value.type.title;
    }
    return null;
  }

  updateSelectedContition(ConditionSelectionModel? model) {
    selectedConditionModel?.value = model!;
    update();
  }

  void setupImageSiders() {
    for (int i = 0; i < images.length; i++) {
      imageSiders.add(
        Container(
          height: 169.h,
          width: 323.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.themeLightGrey),
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: kElevationToShadow[3]),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: ImageView(
                  image: images[i] ?? '',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(Get.context!).size.width,
                  height: MediaQuery.of(Get.context!).size.height,
                ),
              ),
              Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    width: 27.w,
                    height: 64.h,
                    decoration: BoxDecoration(
                        color: AppColors.themeWhite,
                        border: Border.all(color: AppColors.themeBorderGrey),
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.themeBorderGrey,
                              blurRadius: 6.sp,
                              spreadRadius: 3.r)
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "23",
                            style: AppTextStyle.openSans_bold_themeBlack_10,
                          ),
                          Divider(height: 0.0, color: AppColors.themeDiverGrey),
                          Text(
                            "23",
                            style: AppTextStyle.openSans_bold_themeBlack_10,
                          ),
                          Image.asset(
                            AppImages.profileTabActiveIcon,
                            height: 13.h,
                            width: 15.w,
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    }
  }
}

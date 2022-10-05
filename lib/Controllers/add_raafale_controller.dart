import 'dart:io';

import 'package:assement/Controllers/alert_managar_controller.dart';
import 'package:assement/Controllers/home_controller.dart';
import 'package:assement/Models/DataModels/category.dart';
import 'package:assement/Models/DataModels/price_list.dart';
import 'package:assement/Models/DataModels/condition_selection_model.dart';
import 'package:assement/Models/DataModels/response_model.dart';
import 'package:assement/Utils/app_logger.dart';
import 'package:assement/Utils/constants.dart';
import 'package:assement/Utils/enum_all.dart';
import 'package:assement/Utils/extensions.dart';
import 'package:assement/Utils/network_manager/api_constant.dart';
import 'package:assement/Utils/network_manager/remote_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/DataModels/dashboard.dart';
import '../Views/Custom/image_view.dart';

class AddRaffaleController extends GetxController {
  RxList<File> images = <File>[].obs;
  List<XFile> tempImages = <XFile>[];
  Rx<ConditionSelectionModel> selectedConditonType = Rx(ConditionSelectionModel(
      type: ConditionType.newInPackage, isSelected: true));
  RxList<Widget> imageSiders = <Widget>[].obs;

  List<int> ticketsPrices = <int>[].obs;

  RxString title = ''.obs;
  RxString decribeItem = ''.obs;
  RxString tag = ''.obs;
  RxList<String> listPrices = <String>[].obs;
  RxInt productValue = 20.obs;

  Rx<CategorySelectionModel> selectedCategory = Rx(CategorySelectionModel(
      isSelected: false,
      category: Banners(id: 0, name: '', image: '', state: '', raffleId: 0)));

  RxList<ConditionSelectionModel> items = <ConditionSelectionModel>[].obs;
  var categoryItems = <CategorySelectionModel>[].obs;
  RxList<Banners> categories = <Banners>[].obs;
  RxList<PriceList> priceList = <PriceList>[].obs;
  RxInt pageIndex = 0.obs;

  var indicatorWidth = MediaQuery.of(Get.context!).size.width / 2;

  @override
  void onInit() {
    super.onInit();
    categories = Get.find<HomeController>().categories;
    getPriceList();
    items.value = [
      ConditionSelectionModel(
          type: ConditionType.newInPackage, isSelected: true),
      ConditionSelectionModel(
          type: ConditionType.lightlyUsed, isSelected: false),
      ConditionSelectionModel(type: ConditionType.used, isSelected: false),
    ];

    selectedConditonType.value = items.first;
    setupCategoryItems();
  }

  void addRaffale() async {}

  void pickedImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? multipleImages = await picker.pickMultiImage();

      if (multipleImages!.isNotEmpty) {
        if (tempImages.isEmpty) {
          tempImages = multipleImages;
        } else {
          if (tempImages.length != 10) {
            for (int i = 0; i < multipleImages.length; i++) {
              tempImages.add(multipleImages[i]);
            }
          } else {
            AlertManagerController.showSnackBar(
                '', 'Maximum limit rearched', Position.bottom);
          }
        }
        setupToFiles();
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

  void setupCategoryItems() {
    for (int i = 0; i < categories.length; i++) {
      if (i == 0) {
        categoryItems.add(
            CategorySelectionModel(category: categories[i], isSelected: true));
      } else {
        categoryItems.add(
            CategorySelectionModel(category: categories[i], isSelected: false));
      }
    }
    selectedCategory.value = categoryItems.first;
  }

  void updateSelection(int index) {
    for (int i = 0; i < items.length; i++) {
      if (i == index) {
        items[i].isSelected = true;
        selectedConditonType.value = items[i];
      } else {
        items[i].isSelected = false;
      }
    }
    items.refresh();
  }

  void updateCategorySelection(int index) {
    for (int i = 0; i < categoryItems.length; i++) {
      if (i == index) {
        categoryItems[i].isSelected = true;
        selectedCategory.value = categoryItems[i];
      } else {
        categoryItems[i].isSelected = false;
      }
    }
    categoryItems.refresh();
  }

  void getPriceList() async {
    ResponseModel<List<PriceList>> priceListResonse = await sharedServiceManager
        .createGetRequest(typeOfEndPoint: APIType.ticketPriceList);

    if (priceListResonse.status == APIConstant.statusCodeSuccess) {
      print(priceListResonse.message);
      priceList.value = priceListResonse.data ?? [];
    } else {
      AlertManagerController.showSnackBar(
          '', priceListResonse.message, Position.bottom);
    }
  }

  void createRaffale() async {
    Map<String, dynamic> params = {};
    params['title'] = title;
    params['quantity'] = 40;
    params['value'] = productValue.value;
    params['price'] = '5';
    params['earning'] = 9.24;
    params['condition'] = selectedConditonType.value.type.value;
    params['ticket_price_id'] = 1;

    if (decribeItem.value.isNotEmpty) params['details'] = decribeItem;

    if (tag.value.isNotEmpty) params['tag'] = tag.value;

    if (selectedCategory.value.category.id != null)
      params['category_id'] = selectedCategory.value.category.id;

    List<AppMultiPartFile> files = [
      AppMultiPartFile(localFiles: images, key: 'images')
    ];
    AlertManagerController.showLoaderDialog(Get.context!);
    ResponseModel addRaafaleResponse = await sharedServiceManager
        .uploadRequest(APIType.addRaffale, params: params, arrFile: files);

    AlertManagerController.hideLoaderDialog();

    if (addRaafaleResponse.status == APIConstant.statusCodeSuccess) {
      print(addRaafaleResponse.message);
    } else {
      AlertManagerController.showSnackBar(
          '', addRaafaleResponse.message, Position.bottom);
    }
  }

  void setupToFiles() {
    tempImages.forEach((element) {
      images.add(File(element.path));
    });
    setupImageSiders();
  }

  void setupImageSiders() {
    for (int i = 0; i < images.length; i++) {
      imageSiders.add(
        AspectRatio(
          aspectRatio: 323.w / 169.h,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.themeLightGrey),
                borderRadius: BorderRadius.circular(15.r)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: AspectRatio(
                    aspectRatio: 323.w / 169.h,
                    child: ImageView(
                      image: images[i].path,
                      imageType: ImageType.file,
                      fit: BoxFit.cover,
                    ),
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
                            Divider(
                                height: 0.0, color: AppColors.themeDiverGrey),
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
        ),
      );
    }
  }
}

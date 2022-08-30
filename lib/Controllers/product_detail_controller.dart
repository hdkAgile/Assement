import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Models/DataModels/product_detail_models.dart';
import '../Models/DataModels/response_model.dart';
import '../Utils/constants.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import '../Views/Custom/image_view.dart';
import 'alert_managar_controller.dart';

class ProductDetailController extends GetxController {
  RxBool isLoading = RxBool(false);
  int id;
  Rx<ProductDetailData> productDetailData = ProductDetailData().obs;
  RxList<Widget> imageSiders = <Widget>[].obs;
  RxInt pageIndex = 0.obs;

  double indicatorWidth = MediaQuery.of(Get.context!).size.width / 2;

  ProductDetailController({required this.id});

  @override
  void onInit() {
    super.onInit();
    fetchProductDetail();
  }

  void fetchProductDetail() async {
    isLoading.value = true;

    ResponseModel<ProductDetailData> responseModel =
        await sharedServiceManager.createGetRequest(
            typeOfEndPoint: APIType.raffleDetail, urlParam: id.toString());

    isLoading.value = false;

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      productDetailData.value = responseModel.data ?? ProductDetailData();
      setupImageSiders();
    } else {
      AlertManagerController.showSnackBar(
          '', responseModel.message, Position.bottom);
    }
  }

  void changePageIndex(int index) {
    pageIndex.value = index;
  }

  void setupImageSiders() {
    for (int i = 0; i < productDetailData.value.images!.length; i++) {
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
                  image: productDetailData.value.images?[i] ?? '',
                  fit: BoxFit.cover,
                  imageType: ImageType.networkImage,
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

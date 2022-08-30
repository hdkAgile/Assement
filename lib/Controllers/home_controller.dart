import 'package:assement/Models/DataModels/raffale_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Models/DataModels/Dashboard.dart';
import '../Models/DataModels/app_user.dart';
import '../Models/DataModels/response_model.dart';
import '../Models/ParamsModels/LoginApiModel.dart';
import '../Utils/enum_all.dart';
import '../Utils/network_manager/api_constant.dart';
import '../Utils/network_manager/remote_services.dart';
import '../Views/Custom/image_view.dart';

class HomeController extends GetxController {
  RxList<Banners> banners = <Banners>[].obs;
  RxList<Raffale> endingSoon = <Raffale>[].obs;
  RxList<Raffale> winners = <Raffale>[].obs;
  RxList<Raffale> latestRaffles = <Raffale>[].obs;
  RxList<Banners> categories = <Banners>[].obs;
  RxBool isLoading = RxBool(false);
  RxInt pageIndex = 0.obs;

  RxList<Widget> imageSiders = <Widget>[].obs;

  SingleUser user = sharedUser.user;

  double indicatorWidth = MediaQuery.of(Get.context!).size.width / 2;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDashboard();
  }

  void fetchDashboard() async {
    DashboardAPIModel apiModel = DashboardAPIModel(userId: sharedUser.user.id);
    final params = apiModel.toJson();
    isLoading.value = true;
    ResponseModel<Dashboard> responseModel = await sharedServiceManager
        .createPostRequest(typeOfEndPoint: APIType.dashboard, params: params);
    isLoading.value = false;

    if (responseModel.status == APIConstant.statusCodeSuccess) {
      final dashboard = responseModel.data;
      if (dashboard != null) {
        banners.value = dashboard.banners ?? [];
        endingSoon.value = dashboard.endingSoon ?? [];
        winners.value = dashboard.winners ?? [];
        latestRaffles.value = dashboard.latestRaffles ?? [];
        categories.value = dashboard.categories ?? [];
        setupImageSiders();
      } else {
        print(responseModel.message);
      }
    }
  }

  @override
  // TODO: implement onDelete

  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("On Close called");
  }

  void changePageIndex(int index) {
    pageIndex.value = index;
  }

  void setupImageSiders() {
    for (int i = 0; i < banners.length; i++) {
      imageSiders.add(Container(
        height: 169.h,
        width: 323.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: kElevationToShadow[8]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: ImageView(
            image: banners[i].image ?? '',
            imageType: ImageType.networkImage,
            fit: BoxFit.cover,
          ),
        ),
      ));
    }
  }
}

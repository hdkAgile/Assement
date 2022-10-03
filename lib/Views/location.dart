import 'dart:async';

import 'package:assement/Controllers/profile_controller.dart';
import 'package:assement/Views/Custom/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Utils/constants.dart';

class LocationView extends StatelessWidget {
  LocationView({Key? key}) : super(key: key);
  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    LatLng _center = const LatLng(21.6356704, 69.5967292);
    final Completer<GoogleMapController> controller = Completer();
    return Scaffold(
      backgroundColor: AppColors.themeWhite,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Location',
          style: AppTextStyle.openSans_semibold_themeBlack_15,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(AppImages.backArrow)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 35.h,
              decoration: BoxDecoration(
                  color: AppColors.themeLightTextGrey,
                  borderRadius: BorderRadius.circular(4.r)),
              margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Image.asset(AppImages.search),
                    border: InputBorder.none,
                    hintText: AppText.searchText,
                    hintStyle: AppTextStyle.openSans_semibold_textGrey_14),
              ),
            ),
            AspectRatio(
              aspectRatio: 300.w / 363.h,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23.r),
                  child: Obx(() => GoogleMap(
                        onTap: (latlng) {
                          profileController.latLng.value = latlng;
                        },
                        zoomControlsEnabled: false,
                        onMapCreated: (googleMapController) {
                          controller.complete(googleMapController);
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            zoom: 14.0, target: profileController.latLng.value),
                      )),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 35.w, vertical: 50.h),
                width: double.infinity,
                child: AppButton(
                  title: 'Set Location',
                  isEnable: true,
                  onPressed: () async {
                    if (await profileController.updateAddress()) {
                      Get.back();
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}

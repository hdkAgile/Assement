import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Utils/constants.dart';

enum ImageType { asset, file, networkImage }

class ImageView extends StatelessWidget {
  double? height;
  double? width;
  String image;
  BoxFit? fit;
  ImageType imageType;

  ImageView({
    Key? key,
    required this.image,
    required this.imageType,
    this.height,
    this.fit,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return Image.asset(AppImages.imagePlaceholder,
          height: height, width: width, fit: fit);
    } else {
      switch (imageType) {
        case ImageType.asset:
          return Image.asset(
              image.isNotEmpty ? image : AppImages.imagePlaceholder);
        case ImageType.file:
          return Image.file(File(image));
        case ImageType.networkImage:
          return CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: image,
            fit: fit,
            placeholder: (context, url) =>
                Image.asset(AppImages.imagePlaceholder, fit: fit),
            errorWidget: (context, url, error) =>
                Image.asset(AppImages.imagePlaceholder, fit: fit),
          );
      }
    }
  }
}

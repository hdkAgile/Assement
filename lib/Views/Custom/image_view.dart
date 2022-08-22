import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Utils/constants.dart';

enum ImageType { asset, network, networkImage }

class ImageView extends StatelessWidget {
  double? height;
  double? width;
  String image;
  BoxFit? fit;

  ImageView({
    Key? key,
    required this.image,
    this.height,
    this.fit,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

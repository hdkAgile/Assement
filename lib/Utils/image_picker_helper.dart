import 'dart:math';

import 'package:image_picker/image_picker.dart';

import 'enum_all.dart';

var shared = ImagePickerHelper.shared;

class ImagePickerHelper {
  ImagePickerHelper._internal();

  static final ImagePickerHelper shared = ImagePickerHelper._internal();
  final ImagePicker _picker = ImagePicker();

  factory ImagePickerHelper() {
    return shared;
  }

  Future<XFile?> openPicker(SourceType sourceType) async {
    XFile? pikcedImage;

    if (sourceType == SourceType.camera) {
      pikcedImage = await _picker.pickImage(source: ImageSource.camera);
    }

    if (sourceType == SourceType.photoLibrary) {
      pikcedImage = await _picker.pickImage(source: ImageSource.gallery);
    }
    return pikcedImage;
  }
}

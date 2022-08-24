import 'package:assement/Utils/enum_all.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddRaffaleController extends GetxController {
  RxList images = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addRaffale() async {}

  void pickedImage(SourceType sourceType) async {
    final ImagePicker picker = ImagePicker();
    XFile? file;
    if (sourceType == SourceType.photoLibrary) {
      file = await picker.pickImage(source: ImageSource.gallery);
    } else {
      file = await picker.pickImage(source: ImageSource.camera);
    }
    images.add(file?.path);
    print(file?.path);
  }
}

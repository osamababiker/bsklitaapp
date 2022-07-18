import 'package:get/get.dart';
import 'package:bsklita/controllers/imagePickerController.dart';

class ImagePickerControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePickerController>(() => ImagePickerController());
  }
}

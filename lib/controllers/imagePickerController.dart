import 'dart:io';
import 'package:bsklita/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      // to move image to permanent location
      File tmpFile = File(pickedFile.path);
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final filename = path.basename(pickedFile.path);
      tmpFile = await tmpFile.copy('${appDir.path}/$filename');
    } else {
      Get.snackbar('error'.tr, 'image_picker_not_select_image_error'.tr,
          snackPosition: SnackPosition.BOTTOM,
          colorText: kTextColor,
          backgroundColor: kPrimaryLightColor);
    }
  }
}

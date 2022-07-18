import 'package:get/get.dart';
import 'package:bsklita/controllers/settingsController.dart';

class SettingsControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}

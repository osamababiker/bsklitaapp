import 'package:get/get.dart';
import 'package:bsklita/controllers/locationController.dart';

class LocationControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationControler>(() => LocationControler());
  }
}

import 'package:get/get.dart';
import 'package:bsklita/controllers/couriersController.dart';

class CouriersControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouriersController>(() => CouriersController());
  }
}

import 'package:get/get.dart';
import 'package:bsklita/controllers/slidersController.dart';

class SlidersControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlidersControler>(() => SlidersControler());
  }
}

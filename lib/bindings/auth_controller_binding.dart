import 'package:get/get.dart';
import 'package:bsklita/controllers/authController.dart';

class AuthControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

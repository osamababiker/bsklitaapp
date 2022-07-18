import 'package:get/get.dart';
import 'package:bsklita/controllers/networkController.dart';

class NetworkControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}

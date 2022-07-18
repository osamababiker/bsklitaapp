import 'package:get/get.dart';
import 'package:bsklita/controllers/itemsController.dart';

class ItemsControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemsController>(() => ItemsController());
  }
}

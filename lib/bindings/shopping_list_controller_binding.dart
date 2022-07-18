import 'package:get/get.dart';
import 'package:bsklita/controllers/shoppingListController.dart';

class ShoppingLisrControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingListDbController>(() => ShoppingListDbController());
  }
}

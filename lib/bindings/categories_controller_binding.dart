import 'package:get/get.dart';
import 'package:bsklita/controllers/categoriesController.dart';

class CategoriesControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}

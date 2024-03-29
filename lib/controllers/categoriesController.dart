import 'package:bsklita/models/Category.dart';
import 'package:bsklita/services/categories_service.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  var categoriesList = <Category>[].obs;
  final CategoriesService _categoriesService = CategoriesService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future fetchCategories() async {
    isLoading(true);
    await _categoriesService.fetchCategories().then((response) {
    categoriesList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
}

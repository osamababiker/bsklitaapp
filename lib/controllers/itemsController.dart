import 'package:bsklita/models/Item.dart';
import 'package:bsklita/services/items_service.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  var isLoading = true.obs;
  var itemsList = <Item>[].obs;
  final ItemsService itemsService = ItemsService();
  var price = 0.0.obs;
  var quantity = 0.obs;


  Future fetchItems() async {
    isLoading(true);
    await itemsService.fetchItems().then((response) {
      itemsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  Future fetchItemsByCategory({required int categoryId}) async {
    isLoading(true);
    await itemsService.fetchItemsByCategory(categoryId: categoryId).then(
        (response) {
      itemsList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

}

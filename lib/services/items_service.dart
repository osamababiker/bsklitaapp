import 'package:bsklita/models/Item.dart';
import 'package:get/get.dart';
import '../utils/.env.dart';

class ItemsService extends GetConnect {
  List<Item> parseItems(List responseBody) {
    return responseBody.map<Item>((json) => Item.fromJson(json)).toList();
  }

  Future<List<Item>> fetchItems() async {
    final response = await get(fetchItemsEndPoint);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseItems(response.body['data']);
    }
  }

  Future<List<Item>> fetchItemsByCategory({required int categoryId}) async {
    final response = await get("$fetchItemsByCategoryEndPoint/$categoryId");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseItems(response.body['data']);
    }
  }
}

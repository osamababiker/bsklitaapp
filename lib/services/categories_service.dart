import 'package:bsklita/models/Category.dart';
import 'package:get/get.dart';
import '../utils/.env.dart';

class CategoriesService extends GetConnect { 

  List<Category> parseCategories(List responseBody) {
    return responseBody.map<Category>((json) => Category.fromJson(json)).toList();
  } 

  Future<List<Category>> fetchCategories() async {
    final response = await get(fetchCategoriesEndPoint); 
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseCategories(response.body['data']);
    }
  }
}

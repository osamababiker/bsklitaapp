import 'package:bsklita/models/Category.dart';
import 'package:bsklita/models/ItemImage.dart';
import 'package:bsklita/models/Store.dart';


List<ItemImage> parseItemImages(List responseBody) {
  return responseBody.map<ItemImage>((json) => ItemImage.fromJson(json)).toList();
} 

class Item {
  final int id;
  final String name, nameEn;
  final String? description, descriptionEn;
  final List<ItemImage> images;
  final double? price;
  final int quantity;
  final Store store;
  final Category category;

  Item(
      {required this.id,
      required this.category,
      required this.images,
      required this.name,
      required this.nameEn,
      required this.price,
      required this.description,
      required this.descriptionEn,
      required this.quantity,
      required this.store});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json["id"],
        category: Category.fromJson(json["category"]),
        name: json["name"],
        nameEn: json["nameEn"],
        price: json["price"],
        description: json["description"],
        descriptionEn: json["descriptionEn"],
        images: parseItemImages(json['images']),
        quantity: json['quantity'],
        store: Store.fromJson(json['store']));
  }
}

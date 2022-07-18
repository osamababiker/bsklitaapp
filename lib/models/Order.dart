
import 'package:bsklita/models/ShoppingList.dart';

List<ShoppingList> parseShoppingList(List responseBody) {
  return responseBody.map<ShoppingList>((json) => ShoppingList.fromJson(json)).toList();
} 

class Order {
  final int id;
  final int? userId, type, status;
  final String? itemName, itemQuantity, itemImage, 
  deliveryNotes, deliveryTime, pickUpAddress, deliveryAddress,
  confirmOrder; 
  final List<ShoppingList>? shoppingList;
  final double? pickUpLat, pickUpLng, deliveryLat, deliveryLng;

  Order({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.itemName,
    required this.itemQuantity,
    required this.itemImage,
    required this.deliveryNotes,
    required this.deliveryTime,
    required this.pickUpAddress,
    required this.deliveryAddress,
    required this.confirmOrder,
    required this.pickUpLat,
    required this.deliveryLat,
    required this.deliveryLng,
    required this.pickUpLng,
    required this.shoppingList
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json["userId"],
      type: json["type"],
      status: json["status"],
      itemName: json["itemName"],
      itemImage: json["itemImage"],
      itemQuantity: json["itemQuantity"],
      deliveryNotes: json["deliveryNotes"],
      deliveryTime: json["deliveryTime"],
      pickUpAddress: json["pickUpAddress"],
      deliveryAddress: json["deliveryAddress"],
      confirmOrder: json["confirmOrder"],
      pickUpLat: json["pickUpLat"],
      deliveryLat: json["deliveryLat"],
      pickUpLng: json["pickUpLng"],
      deliveryLng: json["deliveryLng"],
      shoppingList: parseShoppingList(json['shoppingList'])
    );
  }
}

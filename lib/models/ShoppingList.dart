
class ShoppingList {
  final String name, image;
  final String? shoppingNote;
  final double? price;
  final int id, itemId, categoryId, quantity, isCustomOrder;

  ShoppingList(
      {required this.id,
      required this.itemId,
      required this.categoryId,
      required this.name,
      required this.image,
      required this.price,
      required this.shoppingNote,
      required this.quantity,
      required this.isCustomOrder});

  factory ShoppingList.fromJson(Map<String, dynamic> map) {
    return ShoppingList(
        id: map["id"],
        itemId: map["itemId"],
        categoryId: map["categoryId"],
        name: map["name"],
        image: map["image"],
        price: map["price"],
        shoppingNote: map["shoppingNote"],
        quantity: map["quantity"],
        isCustomOrder: map["isCustomOrder"]);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['itemId'] = itemId;
    map['categoryId'] = categoryId;
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    map['quantity'] = quantity;
    map['shoppingNote'] = shoppingNote;
    map['isCustomOrder'] = isCustomOrder;
    return map;
  }
}

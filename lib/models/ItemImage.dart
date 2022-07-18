
class ItemImage {
  final int id, itemId;
  final String image;

  ItemImage(
      {required this.id,
      required this.itemId,
      required this.image,});

  factory ItemImage.fromJson(Map<String, dynamic> json) {
    return ItemImage(
        id: json["id"],
        itemId: json["itemId"] ,
        image: json["image"],);
  }
}

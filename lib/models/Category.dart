
class Category {
  final int id, itemsCount;
  final String name , nameEn, logo, slider;

  Category({
    required this.id,  
    required this.itemsCount,
    required this.name,
    required this.nameEn,
    required this.logo,
    required this.slider
  });


  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      itemsCount: json["itemsCount"],
      name: json["name"],
      nameEn: json["nameEn"],
      logo: json["logo"],
      slider: json["slider"]
    );
  }
}

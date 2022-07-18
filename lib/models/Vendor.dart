
class Vendor {
  final int id ; 
  final String name , nameEn, image;

  Vendor({
    required this.id, 
    required this.name,
    required this.nameEn,
    required this.image,
  });


  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      name: json["name"],
      nameEn: json["name_en"],
      image: json["image"],
    );
  }
}

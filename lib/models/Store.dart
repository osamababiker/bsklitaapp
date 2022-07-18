class Store {
  final int id;
  final String name, nameEn;
  final String? logo, address;
  final double? lng, lat;

  Store({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.logo,
    required this.address,
    this.lat,
    this.lng
    }
  );

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json["id"],
      name: json["name"],
      nameEn: json["nameEn"],
      logo: json["logo"],
      address: json["address"],
      lat: json["lat"],
      lng: json["lng"],
    );
  }
}

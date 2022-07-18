class User {
  int id;
  String name, phone, avatar;
  String? email;
  double lat, lng;
  String? notificationToken;
  int isVerify, isCourier, role;
  int? verificationCode;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.lat,
      required this.lng,
      required this.notificationToken,
      required this.isVerify,
      required this.verificationCode,
      required this.isCourier,
      required this.role,
      required this.avatar});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        lat = json['lat'],
        lng = json['lng'],
        notificationToken = json['notificationToken'],
        isVerify = json['isVerify'],
        verificationCode = json['verificationCode'],
        isCourier = json['isCourier'],
        role = json['role'],
        avatar = json['avatar'];
}

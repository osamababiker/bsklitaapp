import 'package:bsklita/models/User.dart';

class Courier {
  int id, isApproved, isActive, userId;
  String personalPicture, personalId;
  String? phone, drivingLicense, deliveryMethodPicture;
  User user;
 
  Courier({
    required this.id,
    required this.phone,
    required this.drivingLicense,
    required this.deliveryMethodPicture,
    required this.personalId,
    required this.personalPicture,
    required this.isActive,
    required this.isApproved,
    required this.userId,
    required this.user
  });

  Courier.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        phone = json['phone'],
        drivingLicense= json['emdrivingLicenseail'],
        deliveryMethodPicture = json['deliveryMethodPicture'],
        personalId = json['personalId'],
        personalPicture = json['personalPicture'],
        isActive = json['isActive'],
        isApproved = json['isApproved'],
        userId = json['userId'],
        user = User.fromJson(json['user']);
}

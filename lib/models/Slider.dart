
import 'package:bsklita/models/Store.dart';

class Slider {
  final int id;
  final String image;
  final Store store; 

  Slider({ 
    required this.id,
    required this.image,
    required this.store
  });


  factory Slider.fromJson(Map<String, dynamic> json) {
    return Slider(
      id: json['id'],
      image: json["image"],
      store: Store.fromJson(json["store"]),
    );
  }
}

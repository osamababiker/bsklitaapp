import 'package:bsklita/models/Slider.dart';
import 'package:get/get.dart';
import '../utils/.env.dart';

class SlidersService extends GetConnect {
  List<Slider> parseSliders(List responseBody) {
    return responseBody.map<Slider>((json) => Slider.fromJson(json)).toList();
  }

  Future<List<Slider>> fetchSliders() async {
    final response = await get(fetchSlidersEndPoint);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseSliders(response.body['data']);
    }
  }
}

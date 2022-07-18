import 'package:bsklita/models/Courier.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../utils/.env.dart';

const storage = FlutterSecureStorage();

class CouriersService extends GetConnect {
  String token = '';
  @override
  void onInit() async {
    token = await storage.read(key: 'token') as String;
    super.onInit();
  }

  List<Courier> parseCouriers(List responseBody) {
    return responseBody.map<Courier>((json) => Courier.fromJson(json)).toList();
  }

  Future<List<Courier>> fetchCouriers() async {
    final response = await get(fetchCouriersEndPoint);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return parseCouriers(response.body['data']);
    }
  }

  Future<Courier> registerCourier({required Map formData}) async {
    final response = await post(
      registerCourierEndPoint,
      formData,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['data'];
    }
  }
}

import 'package:bsklita/models/Courier.dart';
import 'package:get/get.dart';
import 'package:bsklita/services/couriers_service.dart';

class CouriersController extends GetxController {
  var isLoading = true.obs;
  var selectedCourier = ''.obs;
  List<Courier> couriersList = [];
  List test = ['ok', 'osama'];

  CouriersService couriersService = CouriersService();
  @override
  void onInit() {
    fetchCouriers();
    super.onInit();
  }

  Future fetchCouriers() async {
    isLoading(true);
    await couriersService.fetchCouriers().then((response) {
      couriersList = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  Future registerCourier({required Map formData}) async {
    isLoading(true);
    await couriersService.registerCourier(formData: formData);
    isLoading(false);
    return true;
  }
}

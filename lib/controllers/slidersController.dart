import 'package:bsklita/models/Slider.dart';
import 'package:bsklita/services/sliders_service.dart';
import 'package:get/get.dart';

class SlidersControler extends GetxController {
  var isLoading = true.obs;
  var slidersList = <Slider>[].obs;
  final SlidersService _slidersService = SlidersService();
  @override
  void onInit() {
    getSlider();
    super.onInit();
  }

  Future getSlider() async {
    isLoading(true);
    _slidersService.fetchSliders().then((response) {
      slidersList.value = response;
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }
}

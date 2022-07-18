import 'package:get/get.dart';

class LoginSlide {
  String? imageAssetPath, title;

  LoginSlide({this.imageAssetPath, this.title});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  String? getImageAssetPath() => imageAssetPath;
  String? getTitle() => title;
}

List<LoginSlide> getSlides() {
  List<LoginSlide> slides = <LoginSlide>[];
  LoginSlide sliderModel = LoginSlide();

  //1
  sliderModel.setTitle("signin_screen_description".tr);
  sliderModel.setImageAssetPath("assets/icons/biking_1.svg");
  slides.add(sliderModel);

  sliderModel = LoginSlide();

  //2
  sliderModel.setTitle("signin_screen_description".tr);
  sliderModel.setImageAssetPath("assets/icons/biking_1.svg");
  slides.add(sliderModel);

  sliderModel = LoginSlide();

  sliderModel = LoginSlide();

  return slides;
}

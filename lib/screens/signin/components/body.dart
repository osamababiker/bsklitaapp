import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/authController.dart';
import 'package:bsklita/controllers/locationController.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/custom_suffix_icon.dart';

final AuthController _authController = Get.find<AuthController>();
final LocationControler _locationControler = Get.find<LocationControler>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Widget buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 300,
                  child: PageView(
                    controller: _authController.slidesController,
                    onPageChanged: (index) {
                      _authController.slideIndex.value = index;
                    },
                    children: [
                      SlideTile(
                        imagePath: _authController.slides[0].getImageAssetPath(),
                        title: _authController.slides[0].getTitle(),
                        formField: buildNameFormField(),
                      ),
                      SlideTile(
                        imagePath: _authController.slides[1].getImageAssetPath(),
                        title: _authController.slides[1].getTitle(),
                        formField: buildPhoneFormField(),
                      ),
                    ],
                  ),
                ),
                _authController.slideIndex.value != 1
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _authController.slidesController.animateToPage(
                              _authController.slideIndex.value - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        child: Text(
                          "previous".tr,
                          style: const TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 2; i++)
                            i == _authController.slideIndex.value
                                ? buildPageIndicator(true)
                                : buildPageIndicator(false),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          _authController.slidesController.animateToPage(
                              _authController.slideIndex.value + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        child: Text(
                          "next".tr,
                          style: const TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: DefaultButton(
                      text: "signin_screen_signin_btn".tr,
                      press: () async {
                        Map formData = {
                          'name': _authController.nameController.text,
                          'phone': _authController.phoneController.text,
                          'lat': _locationControler.lat.value,
                          'lng': _locationControler.lng.value,
                          'deviceName': _authController.deviceName,
                          'notificationToken':
                              _authController.notificationToken,
                        };
                        await _authController.login(formData: formData);
                        if (_authController.authenticated) {
                          Get.toNamed('/otp');
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String? imagePath, title;
  final TextFormField formField;

  const SlideTile(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.formField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height: getScreenSize(context) * 20.0,
                child: SvgPicture.asset(imagePath!)),
            const VerticalSpacing(of: 3.0),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            formField
          ],
        ),
      ),
    );
  }
}

TextFormField buildPhoneFormField() {
  return TextFormField(
    keyboardType: TextInputType.phone,
    onSaved: (value) {
      _authController.phoneController.text = value!;
    },
    validator: (value) {
      _authController.validatePhone(value!);
    },
    controller: _authController.phoneController,
    decoration: InputDecoration(
      labelText: "signin_screen_phone_field_label".tr,
      hintText: "signin_screen_phone_field_hint".tr,
      suffixIcon: const CustomSuffixIcon(
        svgIcon: "assets/icons/Phone.svg",
      ),
    ),
  );
}

TextFormField buildNameFormField() {
  return TextFormField(
    keyboardType: TextInputType.name,
    onSaved: (value) {
      _authController.nameController.text = value!;
    },
    validator: (value) {
      _authController.validateName(value!);
    },
    controller: _authController.nameController,
    decoration: InputDecoration(
      labelText: "signin_screen_name_field_label".tr,
      hintText: "signin_screen_name_field_hint".tr,
      suffixIcon: const CustomSuffixIcon(
        svgIcon: "assets/icons/User.svg",
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

TextFormField buildOtpFormField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    onSaved: (value) {
      _authController.nameController.text = value!;
    },
    validator: (value) {
      _authController.validateOtp(value!);
    },
    controller: _authController.otpController,
    decoration: InputDecoration(
      labelText: "signin_screen_otp_field_label".tr,
      hintText: "signin_screen_otp_field_hint".tr,
      suffixIcon: const CustomSuffixIcon(
        svgIcon: "assets/icons/User.svg",
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/authController.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/custom_suffix_icon.dart';

final AuthController _authController = Get.find<AuthController>();

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
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: getScreenSize(context) * 20.0,
                        child: SvgPicture.asset("assets/icons/biking_1.svg")),
                    const VerticalSpacing(of: 3.0),
                    Text(
                      "signin_screen_description".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const VerticalSpacing(of: 2.0),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: buildOtpFormField(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: DefaultButton(
                          text: "otp_screen_signin_btn".tr,
                          press: () async {
                            Map formData = {
                              'userId': _authController.user.id,
                              'otpCode':
                                  int.parse(_authController.otpController.text),
                            };
                            await _authController
                                .otpVerification(formData: formData);
                            if (_authController.verified) {
                              Get.toNamed('/home');
                            } else {
                              Get.snackbar('otp_screen_wrong_otp_title'.tr,
                                  'otp_screen_wrong_otp_message'.tr,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: kPrimaryLightColor);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextFormField buildOtpFormField() {
  return TextFormField(
    keyboardType: TextInputType.number,
    onSaved: (value) {
      _authController.otpController.text = value!;
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

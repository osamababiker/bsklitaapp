import 'package:bsklita/constants.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../components/custom_suffix_icon.dart';


class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "couriers_screen_title".tr,
              style: const TextStyle(
                fontSize: 18,
                color: kTextColor
              ),
            ),
            const VerticalSpacing(of: 2.0),
            buildNameFormField(),
            buildPhoneFormField(),
            buildIdCardImageFormField(),
            buildDeliveryMethodImageFormField(),
            const VerticalSpacing(of: 2.0),
            DefaultButton(
              text: "couriers_screen_register_btn".tr, 
              press: () {}
            )
          ],
        ),
      ),
    );
  }

  

buildNameFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset:  Offset(2 , 5),
            blurRadius: 2,
            color: kPrimaryLightColor
          )
        ]
      ),
      child: TextFormField(
        onChanged: (value){
        },
        validator: (value){
        },
        decoration: InputDecoration(
          labelText: "couriers_screen_name_field_lable".tr,
          hintText: "couriers_screen_name_field_hint".tr,
          hintStyle: const TextStyle(color: kTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/User.svg",),
        ),
      ),
    ),
  );
}


buildPhoneFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset:  Offset(2 , 5),
            blurRadius: 2,
            color: kPrimaryLightColor
          )
        ]
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value){
        },
        validator: (value){
        },
        decoration: InputDecoration(
          labelText: "couriers_screen_phone_field_lable".tr,
          hintText: "couriers_screen_phone_field_hint".tr,
          hintStyle: const TextStyle(color: kTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg",),
        ),
      ),
    ),
  );
}


Padding buildIdCardImageFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset:  Offset(2 , 5),
              blurRadius: 2,
              color: kPrimaryLightColor
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "couriers_screen_id_card_image".tr,
              style: TextStyle(
                color: kTextColor.withOpacity(0.6),
                fontSize: 16
              ),
            ),
            const VerticalSpacing(of: 1.0),
            SvgPicture.asset("assets/icons/Camera Icon.svg"),
          ],
        ),
      ),
    );
  }
}


Padding buildDeliveryMethodImageFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset:  Offset(2 , 5),
            blurRadius: 2,
            color: kPrimaryLightColor
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "couriers_screen_delivery_methods_image".tr,
            style: TextStyle(
              color: kTextColor.withOpacity(0.6),
              fontSize: 16
            ),
          ),
          const VerticalSpacing(of: 1.0),
          SvgPicture.asset("assets/icons/Camera Icon.svg"),
        ],
      ),
    ),
  );
}

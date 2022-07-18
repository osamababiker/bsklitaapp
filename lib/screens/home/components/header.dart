import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/locationController.dart';
import '../../../size_config.dart';



class HomeHeader extends StatelessWidget implements PreferredSize {
  HomeHeader({
    Key? key,
    required this.height
  }) : super(key: key);

  final double height;
  //final LocationControler _locationController = Get.find<LocationControler>();

  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  Widget get child => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row( 
                children: [
                  HeaderButton(
                    text: "home_screen_header_market_btn".tr,
                    isActive: true,
                    press: () {
                      Get.toNamed('/home');
                    },
                  ),
                  const HorizontalSpacing(of: 1.0),
                  HeaderButton(
                    text: "home_screen_header_deliver_btn".tr,
                    isActive: false,
                    press: () {
                      Get.toNamed('/deliverForMe');
                    },
                  ),
                  const HorizontalSpacing(of: 1.0),
                  HeaderButton(
                    text: "home_screen_header_confirm_btn".tr,
                    isActive: false,
                    press: () {
                      Get.toNamed('/confirmForMe');
                    },
                  )
                ],
              ),
            ),
            const VerticalSpacing(of: 1.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15.0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "home_screen_search_hint".tr,
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 18,
                    ),
                    prefixIcon: const Icon(Icons.search, size: 24)),
              ),
            ),
            const VerticalSpacing(of: 1.0), 
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18),
                Text(
                  "home_screen_delivery_to_hint".tr,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 14),
                ),
                const HorizontalSpacing(of: 0.5),
                const Text(
                  "Duabi - alnahda",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}

class HeaderButton extends StatelessWidget {
  const HeaderButton(
      {Key? key,
      required this.text,
      required this.isActive,
      required this.press})
      : super(key: key);

  final String text;
  final VoidCallback press;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: getScreenSize(context) * 12.0,
        height: getScreenSize(context) * 3.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? kSecondaryColor : kPrimaryLightColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}




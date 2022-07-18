import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../constants.dart';
import '../../size_config.dart';

class TopHeader extends StatelessWidget implements PreferredSize {
  const TopHeader({Key? key, required this.height}) : super(key: key);

  final double height;

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

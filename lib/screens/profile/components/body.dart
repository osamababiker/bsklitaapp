import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:bsklita/constants.dart';
import 'package:get/get.dart';
import 'profile_action_card.dart';


class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/user-icon.jpg"),
              ),
            ),
            const VerticalSpacing(of: 2.0),
            const Text(
              "أسامة محمد",
              style: TextStyle(fontSize: 18),
            ),
            const VerticalSpacing(of: 2.0),
            ProfileActionCard(
              icon: "assets/icons/Gift Icon.svg",
              action: "profile_screen_orders_btn".tr,
              press: () {},
            ),
            ProfileActionCard(
              icon: "assets/icons/Settings.svg",
              action: "profile_screen_settings_btn".tr,
              press: () {},
            ),
            ProfileActionCard(
              icon: "assets/icons/Log out.svg",
              action: "profile_screen_logout_btn".tr,
              press: () {
                Get.toNamed('/settings');
              },
            )
          ],
        ),
      ),
    );
  }
}


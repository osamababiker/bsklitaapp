import 'package:bsklita/controllers/shoppingListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../enums.dart'; 
import '../../size_config.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  final ShoppingListDbController _shoppingListController =
      Get.find<ShoppingListDbController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: getScreenSize(context) * 7.0,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(offset: Offset(10, 10), blurRadius: 10, color: kTextColor)
        ]),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWithBottomTitle(
                  icon: Icons.settings,
                  title: "bottom_nav_settings".tr,
                  press: () {
                    Get.toNamed('/settings');
                  },
                ),
                IconWithBottomTitle(
                  icon: Icons.location_on,
                  title: "bottom_nav_orders".tr,
                  press: () {
                    Get.toNamed('/chat');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/cart');
                  },
                  child: Stack(
                    children: [
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: getScreenSize(context) * 1.5,
                            height: getScreenSize(context) * 1.5,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                            child: Obx( 
                              () => Center(
                                child: Text(
                                  "${_shoppingListController.listCounter.value}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding / 2),
                        child: Column(
                          children: [
                            SizedBox(
                                width: getScreenSize(context) * 3.0,
                                height: getScreenSize(context) * 3.0,
                                child: const Padding(
                                  padding: EdgeInsets.all(kDefaultPadding / 4),
                                  child: Icon(Icons.shopping_bag_outlined,
                                      color: kSecondaryColor),
                                )),
                             Text(
                              "bottom_nav_shopping_list".tr,
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconWithBottomTitle(
                  icon: Icons.notifications_active,
                  title: "bottom_nav_notification".tr,
                  press: () {
                    Get.toNamed('/notifications');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/profile');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: Column(
                      children: [
                        SizedBox(
                            width: getScreenSize(context) * 3.0,
                            height: getScreenSize(context) * 3.0,
                            child: const Padding(
                              padding: EdgeInsets.all(kDefaultPadding / 4),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/user-icon.jpg"),
                              ),
                            )),
                        Text(
                          "bottom_nav_profile".tr,
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class IconWithBottomTitle extends StatelessWidget {
  const IconWithBottomTitle({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: getScreenSize(context) * 3.0,
              height: getScreenSize(context) * 3.0,
              child: Icon(icon,
                  color:
                      isActive ? kPrimaryColor : kTextColor.withOpacity(0.5)),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

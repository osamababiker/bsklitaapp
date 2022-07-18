import 'dart:convert';
import 'dart:io';
import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/authController.dart';
import 'package:bsklita/controllers/ordersController.dart';
import 'package:bsklita/controllers/shoppingListController.dart';
import 'package:bsklita/models/ShoppingList.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../utils/.env.dart';

final ShoppingListDbController _shoppingListController =
Get.find<ShoppingListDbController>();
final OrdersController _ordersController = 
Get.find<OrdersController>();
final AuthController _authController = 
Get.find<AuthController>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                        _shoppingListController.itemsList.length,
                        (index) => ItemCard(
                            item: _shoppingListController.itemsList[index])),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: DefaultButton(
                    text: "cart_screen_send_order_btn".tr,
                    press: () {
                      Get.bottomSheet(Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSpacing(of: 1.0),
                                Text(
                                  "cart_screen_choose_delivry_time_title".tr,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const VerticalSpacing(of: 1.0),
                                Obx(
                                  () => SizedBox(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: Row(
                                          children: [
                                            const Icon(
                                              Icons.list,
                                              size: 16,
                                              color: kTextColor,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "cart_screen_choose_delivry_time_label"
                                                    .tr,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: kTextColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: _ordersController.timeList
                                            .map((_time) =>
                                                DropdownMenuItem<String>(
                                                  value: _time,
                                                  child: Text(
                                                    _time,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ))
                                            .toList(),
                                        value: _ordersController
                                            .selectedTime.value,
                                        onChanged: (value) {
                                          _ordersController.selectedTime.value =
                                              value.toString();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                        ),
                                        iconSize: 14,
                                        iconEnabledColor: kTextColor,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 50,
                                        buttonWidth: 200,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              kDefaultPadding / 2),
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Colors.white,
                                        ),
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,
                                        dropdownPadding: null,
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              kDefaultPadding / 2),
                                          color: Colors.white,
                                        ),
                                        scrollbarRadius: const Radius.circular(
                                            kDefaultPadding / 2),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalSpacing(of: 1.0),
                                DefaultButton(
                                    text: "cart_screen_send_order_btn"
                                        .tr,
                                    press: () async { 
                                      if (!_authController.authenticated) {
                                        Get.toNamed('/signin');
                                      }
                                      List cartList = [];
                                      for (var i = 0;
                                          i <
                                              _shoppingListController
                                                  .itemsList.length; 
                                          i++) {
                                        var cartMap = _shoppingListController
                                            .itemsList[i]
                                            .toJson();
                                        cartList.add(cartMap);
                                      }   
                                      Map formData = {
                                        'type': 1,
                                        'userId': _authController.user.id,
                                        'shoppingList': jsonEncode(cartList),
                                        'deliveryTime': _ordersController.selectedTime.value,
                                      };
                                      await _ordersController.sendOrder(
                                          formData: formData);
                                      Get.snackbar(
                                          'cart_screen_order_has_been_send_title'
                                              .tr,
                                          'cart_screen_order_has_been_send_message'
                                              .tr,
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: kPrimaryLightColor);
                                    })
                              ],
                            ),
                          ),
                        ),
                      ));
                    }),
              ),
            ],
          ),
        ));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ShoppingList item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  color: kPrimaryLightColor)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: getScreenSize(context) * 10.0,
                        height: getScreenSize(context) * 10.0,
                        child: item.isCustomOrder == 0
                            ? CachedNetworkImage(
                                imageUrl: "$uploadUri/items/${item.image}",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Image.asset("assets/icons/loading.gif"),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/icons/loading.gif"),
                              )
                            : Image.file(File(item.image))),
                    const HorizontalSpacing(of: 2.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style:
                              const TextStyle(fontSize: 18, color: kTextColor),
                        ),
                        Row(
                          children: [
                            Text(
                              "Quantity : ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            Text(
                              "${item.quantity}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await _shoppingListController.deleteItem(item.id);
                    Get.snackbar("item_deleted_from_shoppingList_title".tr,
                        "item_deleted_from_shoppingList_message".tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: kPrimaryLightColor);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: SvgPicture.asset("assets/icons/Trash.svg"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

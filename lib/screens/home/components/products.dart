import 'package:bsklita/controllers/itemsController.dart';
import 'package:bsklita/controllers/shoppingListController.dart';
import 'package:bsklita/models/Item.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../utils/.env.dart';
import '../../components/custom_suffix_icon.dart';

final ShoppingListDbController _shoppingList =
    Get.find<ShoppingListDbController>();

class Products extends StatelessWidget {
  const Products({Key? key, required this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              items.length, (index) => ProductCard(item: items[index])),
        ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product');
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Container(
          width: getScreenSize(context) * 15.0,
          height: getScreenSize(context) * 30.0,
          padding: const EdgeInsets.all(kDefaultPadding / 4),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kPrimaryLightColor)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: getScreenSize(context) * 15.0,
                    width: getScreenSize(context) * 15.0,
                    child: CachedNetworkImage(
                      imageUrl: "$uploadUri/items/${item.images[0].image}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Image.asset("assets/icons/loading.gif"),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/icons/loading.gif"),
                    )),
                const VerticalSpacing(of: 1.0),
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: kTextColor),
                ),
                const VerticalSpacing(of: 1.0),
                if (item.price != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AED",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: kTextColor),
                      ),
                      const HorizontalSpacing(of: 1.0),
                      Text(
                        "${item.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                    ],
                  ),
                const VerticalSpacing(of: 2.0),
                GestureDetector(
                  onTap: () {
                    item.price != null
                        ? _shoppingList.itemPrice.value = item.price!
                        : '';
                    _shoppingList.itemQuantity.value = item.quantity;
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
                            children: [
                              const VerticalSpacing(of: 2.0),
                              Text(
                                "home_screen_add_to_shopping_list_title".tr,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const VerticalSpacing(of: 1.0),
                              buildItemQuantityFormField(),
                              const VerticalSpacing(of: 1.0),
                              buildItemPriceFormField(),
                              const VerticalSpacing(of: 1.0),
                              DefaultButton(
                                  text:
                                      "home_screen_add_to_shopping_list_btn".tr,
                                  press: () async {
                                    Map<String, dynamic> listData = {
                                      'itemId': item.id,
                                      'categoryId': item.category.id,
                                      'name': item.nameEn, 
                                      'image': item.images[0].image,
                                      'price': _shoppingList.itemPrice.value,
                                      'quantity': _shoppingList.itemQuantity.value,
                                      'isCustomOrder': 0
                                    };
                                    _shoppingList.addToList(listData: listData);
                                    Get.snackbar(
                                        "adding_to_list_successfully_title".tr,
                                        "adding_to_list_successfully_message"
                                            .tr,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: kPrimaryLightColor);
                                  
                                  })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: SizedBox(
                      width: getScreenSize(context) * 3.0,
                      height: getScreenSize(context) * 3.0,
                      child: SvgPicture.asset("assets/icons/check.svg",
                          color: kPrimaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildItemQuantityFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.number,
      initialValue: _shoppingList.itemQuantity.value.toString(),
      onSaved: (value) {
        _shoppingList.itemQuantity.value = int.parse(value!);
      },
      validator: (value) {
        _shoppingList.validateQuantity(value!);
      },
      decoration: InputDecoration(
        labelText: "home_screen_item_quantity_lable".tr,
        hintText: "home_screen_item_quantity_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Plus Icon.svg",
        ),
      ),
    ),
  );
}

buildItemPriceFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.number,
      initialValue: _shoppingList.itemPrice.value.toString(),
      onSaved: (value) {
        _shoppingList.itemPrice.value = double.parse(value!);
      },
      validator: (value) {
        _shoppingList.validatePrice(value!);
      },
      decoration: InputDecoration(
        labelText: "home_screen_item_price_lable".tr,
        hintText: "home_screen_item_price_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: const CustomSuffixIcon(
          svgIcon: "assets/icons/Plus Icon.svg",
        ),
      ),
    ),
  );
}

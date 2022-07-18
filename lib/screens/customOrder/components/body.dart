import 'dart:io';
import 'package:bsklita/constants.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/imagePickerController.dart';
import '../../../controllers/shoppingListController.dart';
import '../../components/custom_suffix_icon.dart';


final ShoppingListDbController _shoppingList =
Get.find<ShoppingListDbController>();
final ImagePickerController _imagePickerController =
    Get.find<ImagePickerController>();

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: kPrimaryColor),
                  const HorizontalSpacing(of: 1.0),
                  Text(
                    "customOrder_screen_title".tr,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kTextColor
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(of: 2.0),
            buildItemNameFormField(),
            const VerticalSpacing(of: 1.0),
            buildItemPriceFormField(),
            const VerticalSpacing(of: 1.0),
            buildItemQuantityFormField(),
            const VerticalSpacing(of: 1.0),
            buildItemImageFormField(),
            const VerticalSpacing(of: 1.0),
            buildNotesFormField(),
            const VerticalSpacing(of: 2.0),
            DefaultButton(
              text: "customOrder_screen_save_btn".tr, 
              press: () async{
                Map<String, dynamic> listData = {
                  'itemId': 0,
                  'categoryId': 0,
                  'name': _shoppingList.itemNameController.text, 
                  'image': _imagePickerController.selectedImagePath.value,
                  'price': _shoppingList.itemPriceController.text,
                  'quantity': _shoppingList.itemQuantityController.text,
                  'isCustomOrder': 1
                };
                _shoppingList.addToList(listData: listData);
                Get.snackbar(
                    "adding_to_list_successfully_title".tr,
                    "adding_to_list_successfully_message"
                        .tr,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: kPrimaryLightColor);
              } 
            )
          ],
        ),
      ),
    ); 
  }

  

buildItemNameFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      controller: _shoppingList.itemNameController,
      validator: (value) {
        _shoppingList.validateName(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kTextColor.withOpacity(0.2))
        ),
        labelText: "customOrder_screen_item_name_field_lable".tr,
        hintText: "customOrder_screen_item_name_field_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/gift-box.svg",),
      ),
    ),
  );
}


buildItemPriceFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: _shoppingList.itemPriceController,
      validator: (value) {
        _shoppingList.validatePrice(value!);
      },
      decoration: InputDecoration(
        labelText: "customOrder_screen_item_price_field_lable".tr,
        hintText: "customOrder_screen_item_price_field_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Plus Icon.svg",),
      ),
    ),
  );
}


buildItemQuantityFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.number,
      controller: _shoppingList.itemQuantityController,
      validator: (value) {
        _shoppingList.validateQuantity(value!);
      },
      decoration: InputDecoration(
        labelText: "customOrder_screen_item_quantity_field_lable".tr,
        hintText: "customOrder_screen_item_quantity_field_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Plus Icon.svg",),
      ),
    ),
  );
}


Padding buildItemImageFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "customOrder_screen_item_image_field_lable".tr,
              style: TextStyle(
                color: kTextColor.withOpacity(0.6),
                fontSize: 16
              ),
            ),
            const VerticalSpacing(of: 1.0),
            GestureDetector(
                onTap: () {
                  _imagePickerController.pickImage(ImageSource.camera);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
            Obx(() => _imagePickerController.selectedImagePath.value == ''
                ? const Text("")
                : Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                    child: Image.file(
                        File(_imagePickerController.selectedImagePath.value)))),
          ],
        ),
      ),
    );
  }
}
 

buildNotesFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value){
      },
      validator: (value){
      },
      decoration: InputDecoration(
        labelText: "customOrder_screen_item_notes_field_lable".tr,
        hintText: "customOrder_screen_item_notes_field_hint".tr,
        hintStyle: const TextStyle(color: kTextColor),
        suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Conversation.svg"),
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding * 2)
      ),
    ),
  );
}
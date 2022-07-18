import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DeliveryController extends GetxController {
  final GlobalKey<FormState> deliveryFormKey = GlobalKey<FormState>();
  late TextEditingController itemNameController,
      itemQuantityController,
      deliverNoteController;
  var itemName = '';
  var itemQuantity = '';
  var deliverNote = '';

  @override
  void onInit() {
    itemNameController = TextEditingController();
    itemQuantityController = TextEditingController();
    deliverNoteController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    itemNameController.dispose();
    itemQuantityController.dispose();
    deliverNoteController.dispose();
    super.onClose();
  }


  String? validateName(String value) {
    if (!GetUtils.isTxt(value)) {
      return "deliverForMe_screen_name_field_validation_error".tr;
    }
    return null;
  }

  String? validateQuantity(String value) {
    if (!GetUtils.isEmail(value)) {
      return "deliverForMe_screen_quantity_field_validation_error".tr;
    }
    return null;
  }

  void checkDeliveryForm() {
    final isValid = deliveryFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    deliveryFormKey.currentState!.save();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bsklita/models/Order.dart';
import 'package:bsklita/services/orders_service.dart';

class OrdersController extends GetxController {
  var isLoading = true.obs;
  var ordersList = <Order>[].obs;
  var selectedTime = "cart_screen_less_than_one_hour".tr.obs;
  var selectedCourier = ''.obs;
  var couriersList = [].obs;
  final List<String> timeList = [
    "cart_screen_less_than_one_hour".tr,
    "1 " + "hour".tr,
    "2 " + "hour".tr,
    "3 " + "hour".tr,
    "4 " + "hour".tr,
    "5 " + "hour".tr,
    "6 " + "hour".tr,
    "7 " + "hour".tr,
    "8 " + "hour".tr,
    "9 " + "hour".tr,
    "10 " + "hour".tr,
    "11 " + "hour".tr,
    "12 " + "hour".tr,
    "13 " + "hour".tr,
    "14 " + "hour".tr,
    "15 " + "hour".tr,
    "16 " + "hour".tr,
    "17 " + "hour".tr,
    "18 " + "hour".tr,
    "19 " + "hour".tr,
    "20 " + "hour".tr,
    "21 " + "hour".tr,
    "22 " + "hour".tr,
    "23 " + "hour".tr,
    "24 " + "hour".tr,
    "cart_screen_more_than_one_day_option".tr
  ];
  late TextEditingController confirmOrderController,
      itemNameController,
      itemQuantityController,
      deliveryAddressController,
      pickUpAddressController,
      deliveryNotesController;

  OrdersService ordersService = OrdersService();
  @override
  void onInit() {
    fetchOrders();
    confirmOrderController = TextEditingController();
    itemNameController = TextEditingController();
    itemQuantityController = TextEditingController();
    deliveryAddressController = TextEditingController();
    pickUpAddressController = TextEditingController();
    deliveryNotesController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    confirmOrderController.dispose();
    itemNameController.dispose();
    itemQuantityController.dispose();
    deliveryAddressController.dispose();
    pickUpAddressController.dispose();
    deliveryNotesController.dispose();
    super.onClose();
  }

  Future fetchOrders() async {
    isLoading(true);
    await ordersService.fetchOrders().then((response) {
      ordersList.value = response;
    }, onError: (error) {});
    isLoading(false);
  }

  Future sendOrder({required Map formData}) async {
    isLoading(true);
    await ordersService.sendOrder(formData: formData);
    isLoading(false);
    return true;
  }

  String? validateConfirmOrder(String confirmOrder) {
    if (!GetUtils.isTxt(confirmOrder)) {
      return "confirm_for_me_screen_confirm_field_error".tr;
    }
    return null;
  }

  String? validateItemName(String itemName) {
    if (!GetUtils.isTxt(itemName)) {
      return "deliverForMe_screen_name_field_validation_error".tr;
    }
    return null;
  }

  String? validateItemQuantity(String itemQuantity) {
    if (!GetUtils.isTxt(itemQuantity)) {
      return "deliverForMe_screen_quantity_field_validation_error".tr;
    }
    return null;
  }

  String? validateDeliveryAddress(String address) {
    if (!GetUtils.isTxt(address)) {
      return "deliverForMe_screen_delivery_address_field_validation_error".tr;
    }
    return null;
  }

  String? validatePickupAddress(String address) {
    if (!GetUtils.isTxt(address)) {
      return "deliverForMe_screen_pickup_address_field_validation_error".tr;
    }
    return null;
  }
}

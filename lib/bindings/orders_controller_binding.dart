import 'package:get/get.dart';
import 'package:bsklita/controllers/ordersController.dart';

class OrdersControllersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}

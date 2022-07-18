import 'package:bsklita/constants.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/authController.dart';
import '../../../controllers/ordersController.dart';
import '../../components/custom_suffix_icon.dart';

final OrdersController _ordersController = 
Get.find<OrdersController>();
final AuthController _authController = 
Get.find<AuthController>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "confirmForMe_screen_title".tr,
              style: const TextStyle(fontSize: 18, color: kTextColor),
            ),
            const VerticalSpacing(of: 2.0),
            buildOrderFormField(),
            const VerticalSpacing(of: 2.0),
            DefaultButton(
                text: "confirmForMe_screen_confirm_btn".tr,
                press: () async {
                  if (!_authController.authenticated) {
                    Get.toNamed('/signin');
                  }
                  Map formData = {
                    'type': 2,
                    'userId': _authController.user.id,
                    'confirmOrder':
                        _ordersController.confirmOrderController.text
                  };
                  _ordersController.sendOrder(formData: formData);
                })
          ],
        ),
      ),
    );
  }

  buildOrderFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: TextFormField(
        controller: _ordersController.confirmOrderController,
        onSaved: (value) {
          _ordersController.confirmOrderController.text = value!;
        },
        validator: (value) {
          _ordersController.validateConfirmOrder(value!);
        },
        decoration: InputDecoration(
            labelText: "confirmForMe_screen_order_field_lable".tr,
            hintText: "confirmForMe_screen_order_field_hint".tr,
            hintStyle: const TextStyle(color: kTextColor),
            suffixIcon: const CustomSuffixIcon(
                svgIcon: "assets/icons/question_mark.svg"),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 2)),
      ),
    );
  }
}

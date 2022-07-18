import 'package:bsklita/screens/components/top_header.dart';
import 'package:flutter/material.dart';
import 'package:bsklita/screens/components/custom_bottom_nav.dart';
import '../../enums.dart';
import '../../size_config.dart'; 
import 'components/body.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeader(height: getScreenSize(context) * 7.0),
      body: const Body(), 
      bottomNavigationBar: CustomBottomNav(selectedMenu: MenuState.cart),
    );
  }

  

}
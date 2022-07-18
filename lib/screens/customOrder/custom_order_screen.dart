import 'package:bsklita/enums.dart';
import 'package:bsklita/screens/components/custom_bottom_nav.dart';
import 'package:bsklita/screens/components/top_header.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';


class CustomOrderScreen extends StatelessWidget {
  const CustomOrderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeader(height: getScreenSize(context) * 7.0),
      body: const Body(),
      bottomNavigationBar: CustomBottomNav(selectedMenu: MenuState.shop),
    );
  }
}



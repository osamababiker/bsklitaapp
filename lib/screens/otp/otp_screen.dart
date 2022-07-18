import 'package:bsklita/screens/components/top_header.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import '../../enums.dart';
import 'components/body.dart';
import 'package:bsklita/screens/components/custom_bottom_nav.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeader(height: getScreenSize(context) * 7.0),
        body: const Body(), 
        bottomNavigationBar: CustomBottomNav(selectedMenu: MenuState.signin),
    );
  }
}
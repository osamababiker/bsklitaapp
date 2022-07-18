import 'package:bsklita/screens/components/top_header.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';


class ItemsScreen extends StatelessWidget {
  const ItemsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeader(height: getScreenSize(context) * 7.0),
      body: Body(),
    );
  }
}
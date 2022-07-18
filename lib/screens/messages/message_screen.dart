import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [ 
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user-icon.jpg"),
          ),
          const HorizontalSpacing(of: 1.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
              Text(
                "Osama Babiker",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Sudan Khartoum",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'notification_card.dart';


class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width,
            child: Column(
              children: [
                NotificationCard(
                  text: " لديك رسالة جديدة من محمد أحمد ",
                  press: () {},
                ),
                NotificationCard(
                  text: " لديك رسالة جديدة من  Ali ",
                  press: () {},
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}


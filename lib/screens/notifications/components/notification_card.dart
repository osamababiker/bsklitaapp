import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';


class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key, required this.text, required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset:  Offset(0 , 2),
              blurRadius: 2,
              color: kPrimaryLightColor
            )
          ]
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        color: kTextColor.withOpacity(0.6)
                      ),
                    ),
                    const VerticalSpacing(of: 1.0),
                    Text(
                      "2022-2-22: 03:25:02",
                      style: TextStyle(
                        fontSize: 12,
                        color: kTextColor.withOpacity(0.4)
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: SvgPicture.asset("assets/icons/Trash.svg"),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
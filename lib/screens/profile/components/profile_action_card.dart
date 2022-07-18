import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';


class ProfileActionCard extends StatelessWidget {
  const ProfileActionCard({
    Key? key, 
    required this.icon, 
    required this.action, 
    required this.press,
  }) : super(key: key);

  final String icon, action;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding:  const EdgeInsets.all(kDefaultPadding),
        margin: const  EdgeInsets.only(top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          boxShadow: const[
            BoxShadow(
              offset:  Offset(0 , 2),
              blurRadius: 2,
              color: kPrimaryLightColor
          )]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              action,
              style: const TextStyle(
                fontSize: 14,
                color: kTextColor
              ),
            ),
            SvgPicture.asset(icon,color: kTextColor), 
          ],
        ),
      ),
    );
  }
}
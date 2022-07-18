import 'package:bsklita/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key, 
    @required this.svgIcon,
  }) : super(key: key);

  final String? svgIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(
        20,
        20,
        0,
        20
      ),
      child: SvgPicture.asset(
        "$svgIcon",
        height: 18,
        color: kTextColor.withOpacity(0.6),
      ),
    );
  }
}
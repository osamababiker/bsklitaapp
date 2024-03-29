import 'package:flutter/material.dart';
import 'package:bsklita/constants.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, 
    required this.text, 
    required this.press, 
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5)
      ),
      child: TextButton(
        onPressed: press, 
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: kFontFamily
          ),
        ),
      ),
    );
  }
}


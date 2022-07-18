import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';


class CategoryTitleWithMoreBtn extends StatelessWidget {
  const CategoryTitleWithMoreBtn({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: kTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "view_all".tr,
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
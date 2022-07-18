import 'package:bsklita/constants.dart';
import 'package:bsklita/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controllers/settingsController.dart';
import '../../../size_config.dart';
import '../../../utils/.env.dart';


final SettingsController _settingsController = Get.find<SettingsController>();

class Categories extends StatelessWidget {
  Categories({
    Key? key,
    required this.categories
  }) : super(key: key);

  List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(categories.length, (index) => CategoryCard(category: categories[index])),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(50)),
                width: getScreenSize(context) * 7.0,
                height: getScreenSize(context) * 7.0,
                child: SizedBox(
                  child: CachedNetworkImage(
                      imageUrl: "$uploadUri/categories/${category.logo}",
                      placeholder: (context, url) => Image.asset("assets/icons/loading.gif"),
                      errorWidget: (context, url, error) =>  Image.asset("assets/icons/loading.gif"),
                  ),
                ),
              ),
              const VerticalSpacing(of: 1.0),
              Text(
                _settingsController.selectedLanguage.value == 'en' ?
                category.nameEn : 
                category.name,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: kTextColor,
                    fontSize: 14),
              )
            ],
          ),
          const HorizontalSpacing(of: 3.0)
        ],
      ),
    );
  }
}

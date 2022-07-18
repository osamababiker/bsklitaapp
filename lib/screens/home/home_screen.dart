import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/itemsController.dart';
import 'package:bsklita/controllers/categoriesController.dart';
import 'package:bsklita/controllers/settingsController.dart';
import 'package:bsklita/screens/home/components/category_with_more_btn.dart';
import 'package:flutter/material.dart';
import 'package:bsklita/size_config.dart';
import 'package:get/get.dart';
import '../../enums.dart';
import '../components/custom_bottom_nav.dart';
import 'components/categories_card.dart';
import 'components/header.dart';
import 'components/products.dart';
import 'components/slider.dart';

final CategoriesController _categoriesController =
Get.find<CategoriesController>(); 
final ItemsController _itemsController = 
Get.find<ItemsController>();
final SettingsController _settingsController = 
Get.find<SettingsController>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(height: getScreenSize(context) * 15.0),
      body: Obx((() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSlider(),
              const VerticalSpacing(of: 1.0),
              _categoriesController.isLoading.value
                  ? Center(
                      child: SizedBox(
                          width: getScreenSize(context) * 20.0,
                          height: getScreenSize(context) * 20.0,
                          child: Image.asset("assets/icons/loading.gif")
                        ),
                    )
                  :  Categories(categories: _categoriesController.categoriesList),
                     const VerticalSpacing(of: 2.0), 
                     Expanded( 
                      child: ListView.builder(
                        itemBuilder: (buildContext, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryTitleWithMoreBtn(
                                  title:_settingsController.selectedLanguage.value == 'en' ?  _categoriesController
                                      .categoriesList[index].nameEn : _categoriesController
                                      .categoriesList[index].name),
                              FutureBuilder(
                                  future: _itemsController.fetchItemsByCategory(
                                      categoryId: _categoriesController
                                          .categoriesList[index].id),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!_itemsController.isLoading.value) {
                                      return Products(items: _itemsController.itemsList);
                                    } else {
                                      return Center(
                                        child: Image.asset(
                                            "assets/icons/loading.gif"),
                                      );
                                    }
                                  }),
                            ],
                          );
                        },
                        itemCount: _categoriesController.categoriesList.length,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                      ),
                    )
            ],
          ))),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed('/customOrder');
        },
        child: Container(
          decoration: BoxDecoration(
              color: kSecondaryColor, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Icon(Icons.add, size: 36, color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedMenu: MenuState.chat),
    );
  }
}

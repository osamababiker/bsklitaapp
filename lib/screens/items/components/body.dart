import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/ItemsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final ItemsController _itemsControler = Get.find<ItemsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Obx(() {
        if (_itemsControler.isLoading.value) {
          return Skeleton(
            isLoading: _itemsControler.isLoading.value,
            skeleton: SkeletonListView(),
            child: Container(child: Center(child: Text("Content"))
            ),
          );
        } else {
          return StaggeredGrid.count(
            crossAxisCount: _itemsControler.itemsList.length,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            children: [
              StaggeredGridTile.fit(
                  crossAxisCellCount: 2, child: Image.asset(""))
            ],
          );
        }
      }),
    );
  }
}

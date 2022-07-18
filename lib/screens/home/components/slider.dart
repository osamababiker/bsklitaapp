import 'package:bsklita/controllers/slidersController.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bsklita/size_config.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../constants.dart';
import '../../../utils/.env.dart';

final SlidersControler _slidersControler = Get.find<SlidersControler>();

class HomeSlider extends StatefulWidget {
  const HomeSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final List<String> imgList = [
    'assets/images/cover.jpg',
    'assets/images/cover.jpg',
    'assets/images/cover.jpg',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (_slidersControler.isLoading.value) {
      return SizedBox(
        width: double.infinity,
        height: getScreenSize(context) * 15.0,
        child: Center(child: Image.asset("assets/icons/loading.gif"))
      );
    } else {
      return Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: getScreenSize(context) * 15.0,
              child: CarouselSlider(
                items: _slidersControler.slidersList
                    .map((img) => SizedBox(
                        width: getScreenSize(context) * size.width,
                        child: CachedNetworkImage(
                          imageUrl: "$uploadUri/sliders/${img.image}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Image.asset("assets/icons/loading.gif"),
                          errorWidget: (context, url, error) =>  Image.asset("assets/icons/loading.gif"),
                      )))
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              )),
          Positioned(
            bottom: 5.0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _slidersControler.slidersList.map((url) {
                int index = imgList.indexOf(url.image);
                return Container(
                  width: getScreenSize(context) * 2.0,
                  height: getScreenSize(context) * 0.4,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _current == index
                          ? kPrimaryLightColor
                          : kSecondaryColor),
                );
              }).toList(),
            ),
          )
        ],
      );
    }
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/Models/image_filler.dart';

class CarouselView extends StatefulWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  late final List<String> _images = [];
  int number = 6;

  @override
  initState() {
    super.initState();
    ModelClass.imageFiller(_images, number);
  }

  @override
  Widget build(BuildContext context) {
    final double hei = MediaQuery.of(context).size.height;
    final double wdt = MediaQuery.of(context).size.width;

    return CarouselSlider(
      options: CarouselOptions(
        height: hei * 0.65,
        viewportFraction: 1,
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        autoPlayCurve: Curves.bounceInOut,
        autoPlay: true,
      ),
      items: _images
          .map(
            (item) => Builder(builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          )
          .toList(),
    );
  }
}

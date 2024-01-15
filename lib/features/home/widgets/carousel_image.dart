import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e) {
        return Builder(
          builder: (context) => Image.network(
            e,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: height * 0.25,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayCurve: Curves.easeInOut,
      ),
    );
  }
}

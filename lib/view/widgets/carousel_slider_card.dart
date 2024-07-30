import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

class CarouselSliderCard extends StatelessWidget {
  const CarouselSliderCard({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 130.h,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: images.map((String url) {
          return Builder(
            builder: (_) {
              return Container(
                width: context.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(url, fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class LaptopViewCard extends StatelessWidget {
  const LaptopViewCard({
    super.key,
    required this.changeImage,
  });

  final String changeImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(35),
        width: context.width,
        height: context.width * 0.7,
        decoration: ShapeDecoration(
          color: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: BoxShadowManager.productViewItemCardShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            changeImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

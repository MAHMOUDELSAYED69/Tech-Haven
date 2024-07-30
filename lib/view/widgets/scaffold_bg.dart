
import 'package:flutter/material.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
            width: context.width,
            height: 450,
            decoration: BoxDecoration(
              gradient: GradientManager.scaffoldBackgroundGradient,
            ),
        ),
        child
      ],
    );
  }
}

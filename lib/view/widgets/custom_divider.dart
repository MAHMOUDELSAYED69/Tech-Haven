import 'package:flutter/material.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: ColorManager.blue,
          thickness: 1,
          endIndent: 10,
          indent: 30,
        )),
        Text(
          'OR',
          style: context.textTheme.bodySmall?.copyWith( color: ColorManager.blue),
        ),
        const Expanded(
            child: Divider(
          color: ColorManager.blue,
          thickness: 1,
          indent: 10,
          endIndent: 30,
        )),
      ],
    );
  }
}

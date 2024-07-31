import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class FilterProductCard extends StatelessWidget {
  const FilterProductCard({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });

  final String image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.width / 3.3,
          decoration: ShapeDecoration(
            color: ColorManager.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: BoxShadowManager.cardShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  width: 30.h,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: ColorManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: BoxShadowManager.cardShadow,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 6,
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: context.textTheme.bodySmall?.copyWith(fontSize: 18.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}

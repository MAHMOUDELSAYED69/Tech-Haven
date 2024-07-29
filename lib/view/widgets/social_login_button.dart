
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.image,
  });
  final VoidCallback onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        width: 50.w,
        height: 50.w,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: ColorManager.white,
          boxShadow: BoxShadowManager.boxShadow,
        ),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

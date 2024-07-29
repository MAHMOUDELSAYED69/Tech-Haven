import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';
import '../widgets/login_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset(ImageManager.authBackground,
                fit: BoxFit.cover, width: context.width),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                  ),
                ),
                width: context.width,
                height: context.height / 1.5,
              )),
          LoginCard(),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 18),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.white,
            boxShadow: BoxShadowManager.backButtonShadow,
          ),
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: ColorManager.lightGrey,
            size: 25,
            shadows: BoxShadowManager.laptopItemShadow,
          ),
        ),
      ),
    );
  }
}

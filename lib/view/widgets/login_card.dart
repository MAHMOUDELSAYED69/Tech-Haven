import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/my_text_form_field.dart';

import '../../utils/constants/colors.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.height / 5,
      left: 25,
      right: 25,
      child: Container(
        height: context.width / 1.15,
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: BoxShadowManager.boxShadow,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Welcome",
              style: context.textTheme.displayLarge,
            ),
            SizedBox(height: 10.h),
            Divider(
              color: ColorManager.blue,
              thickness: 3,
              endIndent: 100.w,
              indent: 100.w,
            ),
            SizedBox(height: 25.h),
            MyTextFormField(
              hintText: 'Enter your email',
            ),
            SizedBox(height: 12.h),
            MyTextFormField(
              hintText: 'Enter your password',
              obscureText: true,
            ),
            SizedBox(height: 25.h),
            MyElevatedButton(
              title: 'Login',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

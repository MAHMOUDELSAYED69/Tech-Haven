import 'package:flutter/material.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import 'custom_divider.dart';
import 'social_login_button.dart';

class AuthBottomBody extends StatelessWidget {
  const AuthBottomBody({
    super.key, required this.title, this.onTap, required this.buttonTitle,
  });
  final String title;
  final String buttonTitle;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 14),
            const CustomDivider(),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(flex: 3),
                SocialLoginButton(onTap: () {}, image: ImageManager.facebook),
                const Spacer(),
                SocialLoginButton(onTap: () {}, image: ImageManager.apple),
                const Spacer(),
                SocialLoginButton(onTap: () {}, image: ImageManager.google),
                const Spacer(flex: 3),
              ],
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: ColorManager.blue)),
                    InkWell(
                      onTap: onTap,
                      child: Text(buttonTitle,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: ColorManager.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorManager.blue,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

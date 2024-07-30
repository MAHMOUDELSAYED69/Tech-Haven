import 'package:flutter/material.dart';

import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';
import '../widgets/auth_bottom_body.dart';
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
           AuthBottomBody(title: 'Sign Up',onTap: () {},),
          const LoginCard(),
        ],
      ),
    );
  }
}

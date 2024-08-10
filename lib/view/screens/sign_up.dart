import 'package:flutter/material.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';
import '../widgets/auth_bottom_body.dart';
import '../widgets/sign_up_card.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(ImageManager.authBackground,
                fit: BoxFit.cover, width: context.width),
          ),
          AuthBottomBody(
            buttonTitle: 'Sign In',
            title: 'Already have an account? ',
            onTap: () => Navigator.pop(context),
          ),
          const SignUpCard(),
        ],
      ),
    );
  }
}

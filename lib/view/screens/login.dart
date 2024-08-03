import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_haven/utils/constants/routes.dart';

import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';
import '../../viewmodel/login/login_cubit.dart';
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
          AuthBottomBody(
            buttonTitle: 'Sign Up',
            title: 'Don\'t have an account? ',
            onTap: () => Navigator.pushNamed(context, RouteManager.signUp),
          ),
          BlocProvider(
              create: (context) => LoginCubit(), child: const LoginCard()),
        ],
      ),
    );
  }
}

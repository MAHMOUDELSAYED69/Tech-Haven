
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/data/apis/auth_service.dart';
import 'package:tech_haven/utils/constants/routes.dart';

import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import '../widgets/auth_bottom_body.dart';
import '../widgets/login_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthRole _selectedRole = AuthRole.user;
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
          LoginCard(role: _selectedRole),
          Positioned(
            top: 20,
            right: 10,
            child: roleRadio(),
          ),
        ],
      ),
    );
  }

  Widget roleRadio() => Card(
        color: ColorManager.white.withOpacity(0.6),
        child: SizedBox(
          height: 30.h,
          width: 150.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio<AuthRole>(
                    activeColor: ColorManager.blue,
                    value: AuthRole.user,
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text('User', style: context.textTheme.bodySmall),
                ],
              ),
              SizedBox(width: 5.w),
              Row(
                children: [
                  Radio<AuthRole>(
                    activeColor: ColorManager.blue,
                    value: AuthRole.admin,
                    groupValue: _selectedRole,
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text('Admin', style: context.textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      );
}

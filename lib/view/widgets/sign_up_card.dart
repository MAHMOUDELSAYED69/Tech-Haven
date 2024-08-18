import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/routes.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/utils/helper/my_sncakbar.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/my_text_form_field.dart';
import 'package:tech_haven/viewmodel/auth/auth_cubit.dart';

import '../../utils/constants/colors.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({
    super.key,
  });

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();

    super.dispose();
  }

  late GlobalKey<FormState> _formKey;

  String? _fullName;
  String? _email;
  String? _password;

  void signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      context.read<AuthCubit>().signUp(_fullName!, _email!, _password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.height / 5,
      left: 25,
      right: 25,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        height: context.width,
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: BoxShadowManager.boxShadow,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Create Account",
                  style: context.textTheme.displayLarge,
                ),
                SizedBox(height: 6.h),
                Divider(
                  color: ColorManager.blue,
                  thickness: 3,
                  endIndent: 32.w,
                  indent: 32.w,
                ),
                SizedBox(height: 20.h),
                MyTextFormField(
                  hintText: 'Enter your full name',
                  keyboardType: TextInputType.name,
                  onSaved: (data) {
                    _fullName = data;
                  },
                ),
                SizedBox(height: 13.h),
                MyTextFormField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (data) {
                    _email = data;
                  },
                ),
                SizedBox(height: 13.h),
                MyTextFormField(
                  hintText: 'Enter your password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (data) {
                    _password = data;
                  },
                ),
                SizedBox(height: 25.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignUpSuccess) {
                      Navigator.pushNamed(context, RouteManager.otpScreen,
                          arguments: _email);
                      customSnackBar(context,
                          message: 'Sign Up Success',
                          color: ColorManager.correct);
                    } else if (state is AuthFailure) {
                      customSnackBar(context, message: state.error);
                    }
                  },
                  child: MyElevatedButton(
                    title: 'Sign Up',
                    onPressed: signUp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

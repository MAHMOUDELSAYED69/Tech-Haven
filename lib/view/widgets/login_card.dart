import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/data/apis/login_api.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/utils/helper/my_sncakbar.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/my_text_form_field.dart';
import 'package:tech_haven/viewmodel/login/login_cubit.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({
    super.key,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
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

  String? _email;
  String? _password;

  void login() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      context.cubit<LoginCubit>().login(email: _email!, password: _password!);
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
        height: context.width / 1.13,
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
                  "Welcome",
                  style: context.textTheme.displayLarge,
                ),
                SizedBox(height: 6.h),
                Divider(
                  color: ColorManager.blue,
                  thickness: 3,
                  endIndent: 68.w,
                  indent: 68.w,
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text('Forgot Password?',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: ColorManager.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.blue,
                        )),
                    onTap: () => Navigator.pushNamed(
                        context, RouteManager.forgotPassword),
                  ),
                ),
                SizedBox(height: 20.h),
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushReplacementNamed(
                          context, RouteManager.navbar);
                      customSnackBar(context,
                          message: 'Login Success',
                          color: ColorManager.correct);
                    } else if (state is LoginError) {
                      customSnackBar(context, message: state.message);
                    }
                  },
                  child: MyElevatedButton(
                    title: 'Login',
                    onPressed: login,
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

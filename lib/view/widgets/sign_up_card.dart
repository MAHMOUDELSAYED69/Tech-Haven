import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/my_text_form_field.dart';

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
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordController;

  String? _email;
  String? _password;
  String? _confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.height / 5,
      left: 25,
      right: 25,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:  40.0),
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
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (data){
                    _email = data;
                  },
                ),
                SizedBox(height: 13.h),
                MyTextFormField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (data){
                    _password = data;
                  },
                ),
                SizedBox(height: 13.h),
                MyTextFormField(
                  hintText: 'Confirm your password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (data){
                    _confirmPassword = data;
                  },
                  validator: (value) {
                    if(value?.isEmpty ?? false){
                      return '';
                    } if(_passwordController.text != value){
                      return '';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                MyElevatedButton(
                  title: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState!.save();


                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

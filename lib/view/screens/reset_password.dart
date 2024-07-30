import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/my_text_form_field.dart';
import '../widgets/scaffold_bg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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

  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  String? _newPassword;
  String? _confirmNewPassword;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: ScaffoldBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.h),
                Text('Reset Password', style: context.textTheme.bodyLarge),
                SizedBox(height: 90.h),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextFormField(
                        controller: _passwordController,
                        hintText: 'Enter your New Password',
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (data) {
                          _newPassword = data;
                        },
                      ),
                      SizedBox(height: 13.h),
                      MyTextFormField(
                        obscureText: true,
                        hintText: 'Confirm your New Password',
                        keyboardType: TextInputType.visiblePassword,
                        onSaved: (data) {
                          _newPassword = data;
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '';
                          } else if (_passwordController.text != value) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: 40,
              right: 40,
              bottom: MediaQuery.viewInsetsOf(context).bottom + 25.h),
          child: MyElevatedButton(
            title: 'Submit',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, RouteManager.login);
              }
            },
          ),
        ),
      ),
    );
  }
}

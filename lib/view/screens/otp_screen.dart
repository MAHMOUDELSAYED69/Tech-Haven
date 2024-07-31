import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/routes.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/countdown_timer.dart';

import '../widgets/my_elevated_button.dart';
import '../widgets/otp_field.dart';
import '../widgets/scaffold_bg.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
  String _otpValue = '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScaffoldBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.h),
                Text('Verify Email', style: context.textTheme.bodyLarge),
                SizedBox(height: 20.h),
                const CountdownTimer(),
                SizedBox(height: 50.h),
                Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OTPField(onSaved: (data) {
                          _otpValue += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpValue += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpValue += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpValue += data!;
                        }),
                      ],
                    )),
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
            title: 'verify',
            onPressed: () {
              _otpValue = '';
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacementNamed(
                    context, RouteManager.resetPassword);

                log('otp: $_otpValue');
              }
            },
          ),
        ),
      ),
    );
  }
}

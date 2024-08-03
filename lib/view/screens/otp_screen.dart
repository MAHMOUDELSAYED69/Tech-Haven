import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/data/apis/otp_api.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/utils/helper/my_sncakbar.dart';
import 'package:tech_haven/view/widgets/countdown_timer.dart';
import 'package:tech_haven/viewmodel/otp/otp_cubit.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../widgets/my_elevated_button.dart';
import '../widgets/otp_field.dart';
import '../widgets/scaffold_bg.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});

  final String email;

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

  void verifyOtp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context
          .cubit<OtpCubit>()
          .verifyOtp(email: widget.email, otpCode: _otpValue);
      _otpValue = '';
    }
  }

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
          child: BlocListener<OtpCubit, OtpState>(
            listener: (context, state) {
              if (state is OtpSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteManager.login, (route) => false);
                customSnackBar(context,
                    message: 'Verification Success, you can login now',
                    color: ColorManager.correct);
              } else if (state is OtpError) {
                customSnackBar(context, message: state.message);
              }
            },
            child: MyElevatedButton(
              title: 'verify',
              onPressed: verifyOtp,
            ),
          ),
        ),
      ),
    );
  }
}

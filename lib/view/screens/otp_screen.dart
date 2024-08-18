import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/data/apis/auth_service.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/countdown_timer.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/otp_field.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../../utils/helper/my_sncakbar.dart';
import '../../viewmodel/auth/auth_cubit.dart';
import '../widgets/scaffold_bg.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email, required this.role});

  final String email;
  final AuthRole role;

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
  String _otpCode = '';

  void verifyOtp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthCubit>().verifyOtp(widget.email, _otpCode,widget.role);
      _otpCode = '';
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
                          _otpCode += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpCode += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpCode += data!;
                        }),
                        OTPField(onSaved: (data) {
                          _otpCode += data!;
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
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthOtpVerificationSuccess) {
                  customSnackBar(context,
                      message: 'Verification Success',
                      color: ColorManager.correct);
                } else if (state is AuthLoginSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteManager.navbar, (route) => false);
                } else if (state is AuthFailure) {
                  customSnackBar(context, message: state.error);
                }
              },
              child: MyElevatedButton(
                title: 'Verify',
                onPressed: verifyOtp,
              ),
            )),
      ),
    );
  }
}

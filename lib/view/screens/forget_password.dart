import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';
import 'package:tech_haven/view/widgets/my_text_form_field.dart';
import '../../utils/constants/routes.dart';
import '../widgets/scaffold_bg.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.h),
              Text('Forget Password', style: context.textTheme.bodyLarge),
              SizedBox(height: 90.h),
              Form(
                key: _formKey,
                child: MyTextFormField(
                  hintText: 'Enter your Email',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (data) {
                    _email = data;
                  },

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
              Navigator.pushNamed(context, RouteManager.otpScreen);
            }
          },
        ),
      ),
    );
  }
}

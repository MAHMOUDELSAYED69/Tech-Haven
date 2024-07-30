import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    const errorBorder =OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
          color: ColorManager.error,
          width: 1.5
      ),
    );
    const border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide.none
    );
    return Container(
      height: 60,
      width: 55,
      decoration: BoxDecoration(
        boxShadow: BoxShadowManager.boxShadow,
      ),
      child: TextFormField(
        autofocus: true,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }

        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onSaved: onSaved,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: errorBorder,
          focusedErrorBorder:errorBorder,
          fillColor: ColorManager.white,
          filled: true,
        ),
        textAlign: TextAlign.center,
        style: context.textTheme.displayLarge,
      ),
    );
  }
}

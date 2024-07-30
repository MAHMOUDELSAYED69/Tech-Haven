import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    this.hintText,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.keyboardType,
    this.icon,
    this.isVisible,
    this.isVisibleColor,
    this.obscureText,
    this.initialValue,
    this.height,
  });

  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? icon;
  final bool? isVisible;
  final Color? isVisibleColor;
  final bool? obscureText;
  final String? initialValue;
  final double? height;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.25),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        style: context.textTheme.bodySmall,
        cursorColor: ColorManager.blue,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obscureText ??
            (widget.isVisible == true ? isObscure : false),
        validator: widget.validator ??
            (value) {
              if (value!.isEmpty) {
                return  '';
              }
              return null;
            },
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          isCollapsed: true,
          isDense: true,
          suffixIcon: widget.isVisible == true
              ? _buildSuffixIcon(Icons.visibility_off, Icons.visibility)
              : null,
        ),
      ),
    );
  }

  Widget _buildSuffixIcon(IconData icon1, IconData icon2) {
    return IconButton(
      onPressed: () {
        isObscure = !isObscure;
        setState(() {});
      },
      icon: Icon(isObscure == true ? icon1 : icon2),
      color: ColorManager.black,
      iconSize: 7.sp,
    );
  }
}

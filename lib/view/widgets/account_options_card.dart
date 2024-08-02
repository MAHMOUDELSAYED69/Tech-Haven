import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';

class AccountOption extends StatelessWidget {

  const AccountOption({
    super.key,
    required this.icon,
    required this.title,
     this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        splashColor: ColorManager.white,

        onTap: onTap,
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
        trailing:
        Icon(Icons.arrow_forward_ios, size: 20.sp, color: Colors.grey),
      ),
    );
  }
}

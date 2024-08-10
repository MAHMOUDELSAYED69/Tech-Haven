import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/viewmodel/auth/auth_cubit.dart';

import '../../widgets/account_options_card.dart';
import '../../widgets/scaffold_bg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: CircleAvatar(
                    backgroundColor: ColorManager.blue,
                    radius: 50,
                    child: Text('M', style: context.textTheme.bodyLarge),
                  ),
                ),
                SizedBox(height: 15.h),

                // User Info
                Center(
                  child: Text(
                    'Mahmoud Elsayed',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: context.textTheme.bodySmall?.color),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    'john.doe@example.com',
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: ColorManager.grey,
                        fontSize: context.textTheme.bodyMedium?.fontSize),
                  ),
                ),
                SizedBox(height: 30.h),

                // Account Options
                Text(
                  'Account Settings',
                  style: context.textTheme.bodyMedium,
                ),
                const AccountOption(
                  icon: Icons.person,
                  title: 'Profile',
                ),
                const AccountOption(
                  icon: Icons.lock,
                  title: 'Change Password',
                ),
                const AccountOption(
                  icon: Icons.settings,
                  title: 'Settings',
                ),
                const AccountOption(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
                const AccountOption(
                  icon: Icons.language,
                  title: 'Language',
                ),
                const AccountOption(
                  icon: Icons.help,
                  title: 'Help & Support',
                ),

                AccountOption(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    context.read<AuthCubit>().logout();
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

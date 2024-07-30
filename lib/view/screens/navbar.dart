import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tech_haven/view/screens/navbar/account.dart';
import 'package:tech_haven/view/screens/navbar/cart.dart';
import 'package:tech_haven/view/screens/navbar/favorite.dart';

import '../../utils/constants/colors.dart';
import 'navbar/home.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final List<IconData> _icons = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.manage_accounts,
  ];

  final List<String> _texts = [
    "Home",
    "Favorite",
    "Cart",
    "Account",
  ];

  final List<Widget> _screens = const [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return List.generate(_icons.length, (index) {
      return PersistentBottomNavBarItem(
        icon: Icon(_icons[index]),
        title: _texts[index],
        activeColorPrimary: ColorManager.blue,
        inactiveColorPrimary: ColorManager.grey,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navBarsItems(),
      backgroundColor: ColorManager.white,
      handleAndroidBackButtonPress:  true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: 55.h,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: NavBarDecoration(
        boxShadow: BoxShadowManager.boxShadow,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        colorBehindNavBar: ColorManager.white,
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tech_haven/router/page_transition.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

import '../../utils/constants/images.dart';
import '../../utils/constants/routes.dart';
import '../screens/product_screen.dart';
import 'favorite_button.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        customPageRoute:
            PageTransitionManager.fadeTransition(const ProductDetailsScreen()),
        screen: const ProductDetailsScreen(),
        withNavBar: false,
      ),
      // onTap: () => Navigator.pushNamed(context, RouteManager.productDetails),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                color: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: BoxShadowManager.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: 103.6.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: BoxShadowManager.laptopItemShadow,
                    ),
                    child: Image.asset(ImageManager.laptop1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 9.0, right: 9.0, left: 9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Acer',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              'Predator Helios 300',
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: ColorManager.grey),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              '32,000 EGP',
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: ColorManager.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  gradient: GradientManager.addProductButtonBackgroundGradient,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: ColorManager.white,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: FavoriteButton(),
            )
          ],
        ),
      ),
    );
  }
}

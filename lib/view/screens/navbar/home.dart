import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/images.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/carousel_slider_card.dart';
import 'package:tech_haven/view/widgets/filter_product_card.dart';
import 'package:tech_haven/view/widgets/my_searchbar.dart';
import 'package:tech_haven/view/widgets/product_item.dart';

import '../../../utils/constants/routes.dart';
import '../../widgets/filer_product_listview.dart';
import '../../widgets/scaffold_bg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 190.h;
    final double itemWidth = (context.width - 52) / 2;
    final double childAspectRatio = itemWidth / itemHeight;
    return Scaffold(
      body: ScaffoldBackground(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: MySearchBar(),
            ),
            const SliverToBoxAdapter(
              child: CarouselSliderCard(images: [
                ImageManager.acct1,
                ImageManager.acct2,
              ]),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
            const SliverToBoxAdapter(
              child: FilterProductListViewBuilder(
                filterProductList: [
                  FilterProductCard(image: ImageManager.all, text: 'All'),
                  FilterProductCard(image: ImageManager.acer, text: 'Acer'),
                  FilterProductCard(image: ImageManager.razer, text: 'Razer'),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: childAspectRatio,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  return const ProductItemCard();
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

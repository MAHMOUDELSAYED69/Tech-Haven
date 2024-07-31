import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/view/widgets/filter_product_card.dart';

class FilterProductListViewBuilder extends StatelessWidget {
  const FilterProductListViewBuilder(
      {super.key, required this.filterProductList});

  final List<FilterProductCard> filterProductList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
          padding: const EdgeInsets.all(15.5),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: filterProductList.length,
          itemBuilder: (context, index) => filterProductList[index]),
    );
  }
}

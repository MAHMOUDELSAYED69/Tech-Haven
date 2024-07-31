import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/constants/images.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';
import 'package:tech_haven/view/widgets/my_elevated_button.dart';

import '../widgets/laptop_view_card.dart';
import '../widgets/scaffold_bg.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> _imagesList = [
    ImageManager.laptop1,
    ImageManager.laptop2,
    ImageManager.laptop3,
    ImageManager.laptop1,
  ];

  String _image = ImageManager.laptop1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBackground(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 48.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Predator Helios 300',
                          style: context.textTheme.bodyLarge,
                        ),
                        Text(
                          "Type: Gaming Laptop",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: ColorManager.white),
                        ),
                      ],
                    ),
                  ),
                  LaptopViewCard(changeImage: _image),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _imagesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _image = _imagesList[index];
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: ShapeDecoration(
                                color: ColorManager.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                shadows:
                                    BoxShadowManager.productViewItemCardShadow,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(_imagesList[index]),
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: ColorManager.lightGrey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '30,000 EGP',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: context.textTheme.bodySmall?.color),
                        ),
                      ],
                    ),
                    const Spacer(),
                    MyElevatedButton(
                      borderRadius: 10,
                      size: Size(context.width / 2, 40.h),
                      onPressed: () {},
                      title: "Add To Cart",
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                color: ColorManager.lightGrey,
                height: 40,
                thickness: 2,
                endIndent: 50,
                indent: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: context.textTheme.bodySmall?.copyWith(
                        fontSize: context.textTheme.bodyMedium?.fontSize),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      gradient: GradientManager.buttonGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. 
                ''',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: ColorManager.lightGrey,
                        fontSize: 14.5.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

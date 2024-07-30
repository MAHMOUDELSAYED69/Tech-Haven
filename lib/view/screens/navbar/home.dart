import 'package:flutter/material.dart';
import 'package:tech_haven/utils/constants/images.dart';
import 'package:tech_haven/view/widgets/carousel_slider_card.dart';
import 'package:tech_haven/view/widgets/my_searchbar.dart';

import '../../widgets/scaffold_bg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScaffoldBackground(
        child: Center(
            child: Column(
          children: [
            MySearchBar(),
            CarouselSliderCard(images: [
              ImageManager.acct1,
              ImageManager.acct2,
            ])
          ],
        )),
      ),
    );
  }
}

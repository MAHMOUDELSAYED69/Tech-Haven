import 'package:flutter/material.dart';

import '../../widgets/scaffold_bg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScaffoldBackground(
        child:Center(child: Text('Cart')),
      ),
    );
  }
}

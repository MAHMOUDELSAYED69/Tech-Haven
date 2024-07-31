import 'package:flutter/material.dart';

import '../../widgets/scaffold_bg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScaffoldBackground(
        child: Center(child: Text('Account')),
      ),
    );
  }
}

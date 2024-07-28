import 'package:flutter/material.dart';
import 'package:tech_haven/router/app_router.dart';
import 'package:tech_haven/utils/constants/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tech Haven',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/data/apis/auth_service.dart';
import 'package:tech_haven/router/app_router.dart';
import 'package:tech_haven/utils/constants/routes.dart';
import 'package:tech_haven/utils/themes/themes.dart';
import 'package:tech_haven/viewmodel/auth/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => AuthCubit(AuthenticationWebService()),
            child: MaterialApp(
              builder: (context, widget) {
                final mediaQueryData = MediaQuery.of(context);
                final scaledMediaQueryData = mediaQueryData.copyWith(
                  textScaler: TextScaler.noScaling,
                );
                return MediaQuery(
                  data: scaledMediaQueryData,
                  child: widget!,
                );
              },
              title: 'Tech Haven',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              initialRoute: RouteManager.initialRoute,
              onGenerateRoute: AppRouter.onGenerateRoute,
            ),
          );
        });
  }
}

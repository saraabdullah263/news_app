import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            SplashScreen.routeName:(_)=>const SplashScreen()
          },
          theme:AppTheme.theme,
        );
      },
    );
  }
}


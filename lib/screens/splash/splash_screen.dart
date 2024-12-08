import 'package:flutter/material.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
   static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
   Future.delayed(
    const  Duration(seconds: 3),() => Navigator.of(context).pushNamed(HomeScreen.routeName));
   return  Container(
        decoration: BoxDecoration(
          color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.patternimage,
                  ),
                  fit: BoxFit.cover)),
     
    child:  Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(AppAssets.splashIcon,
      width: double.infinity,
      height: double.infinity,)
    
   ));
  }
}
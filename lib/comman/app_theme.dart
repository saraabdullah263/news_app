import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      appBarTheme: AppBarTheme(
        centerTitle: true,
          color: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.sp)),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.white
            ),
            headlineSmall: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.sp 
            )
          )
          );
}

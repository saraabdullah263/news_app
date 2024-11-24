import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/comman/widgets/custom_drawer.dart';
import 'package:news_app/screens/category/category_card.dart';
import 'package:news_app/screens/category/catogory_model.dart';

class CatogeriesScreen extends StatelessWidget {
  const CatogeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CatogoryModel> catogories = [
      CatogoryModel(
          imagePath: AppAssets.ballImage, title: 'Sports', color: AppColors.sportColor),
      CatogoryModel(
          imagePath: AppAssets.politicsImage, title: 'Politics', color: AppColors.ploticsColor),
      CatogoryModel(
          imagePath: AppAssets.healthImage, title: 'Health', color: AppColors.healthColor),
      CatogoryModel(
          imagePath: AppAssets.bussinesImage, title: 'Business', color: AppColors.bussnissColor),
      CatogoryModel(
          imagePath: AppAssets.environmentImage, title: 'Environment', color: AppColors.environmentColor),
      CatogoryModel(
          imagePath: AppAssets.scienceImage, title: 'Scince', color: AppColors.scinceColor),
    ];
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppAssets.patternimage,
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick your catogery\nof interest',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170.h,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 25.w,
                      crossAxisCount: 2),
                  itemCount: 6,
                  itemBuilder: (context, index) => CategoryCard(
                      index: index, catogoryModel: catogories[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

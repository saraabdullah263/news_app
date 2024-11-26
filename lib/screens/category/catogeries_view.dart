import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/screens/category/category_card.dart';
import 'package:news_app/screens/category/models/catogory_model.dart';

class CatogeriesView extends StatelessWidget {
  const CatogeriesView({super.key, required this.onSelectCategory});
 final Function (CatogoryModel) onSelectCategory;
//business entertainment general health science sports technology.
  @override
  Widget build(BuildContext context) {
    List<CatogoryModel> catogories = [
      CatogoryModel(
        id: 'sports',
          imagePath: AppAssets.ballImage, title: 'Sports', color: AppColors.sportColor),
      CatogoryModel(
        id: 'technology',
          imagePath: AppAssets.technologyImage, title: 'Technology', color: AppColors.technologyColor),
      CatogoryModel(
        id: 'health',
          imagePath: AppAssets.healthImage, title: 'Health', color: AppColors.healthColor),
      CatogoryModel(
        id: 'business',
          imagePath: AppAssets.bussinesImage, title: 'Business', color: AppColors.bussnissColor),
      CatogoryModel(
        id: 'entertainment',
          imagePath: AppAssets.entertainmentImage, title: 'Entertainment', color: AppColors.entertainmentColor),
      CatogoryModel(
        id: 'science',
          imagePath: AppAssets.scienceImage, title: 'Scince', color: AppColors.scinceColor),
    ];
    return  Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
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
                  itemCount: catogories.length,
                  itemBuilder: (context, index) => GestureDetector(
                     onTap: () {
                      onSelectCategory(catogories[index]);
                     
                    },
                    child: CategoryCard(
                        index: index, catogoryModel: catogories[index]),
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}

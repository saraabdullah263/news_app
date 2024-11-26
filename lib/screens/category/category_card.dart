import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/category/models/catogory_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.catogoryModel,
    required this.index
  });
 final CatogoryModel catogoryModel;
 final int index;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: catogoryModel.color,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight:const Radius.circular(25),
                bottomLeft: index.isEven ?const Radius.circular(25) : Radius.zero,
                bottomRight:index.isOdd ?const Radius.circular(25) : Radius.zero)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(catogoryModel.imagePath, width: 90.w, fit: BoxFit.contain),
            Text(
              catogoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w400,color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

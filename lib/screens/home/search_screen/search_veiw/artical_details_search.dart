import 'package:flutter/material.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/screens/category/models/news_model.dart';

class ArticalDetalisSearch extends StatelessWidget {

  const ArticalDetalisSearch({super.key, required this.article});
    final Articles article;

  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: BoxDecoration(
          color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.patternimage,
                  ),
                  fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(article.title??'',style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const  SizedBox(height: 8),
            Text(
              article.description??'',
              style:const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            
          ],
        ),
      ),
    );
       
  }

}
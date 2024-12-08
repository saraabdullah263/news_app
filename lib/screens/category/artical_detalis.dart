import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_assets.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/screens/category/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticalDetalis extends StatelessWidget {

  const ArticalDetalis({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.patternimage,
                  ),
                  fit: BoxFit.cover)),
        child: Scaffold(
           backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(article.title??'',style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Image.network(
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/error_network.jpg',
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            article.urlToImage ?? '',),
               const SizedBox(height: 16),
                Text(
                  article.title??'',
                  style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              const  SizedBox(height: 8),
                Text(
                  article.description??'',
                  style:const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              const  SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      article.content??'',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                 Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse(article.url??''));
                  },
                  child: const Text(
                    "View Full Article",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}
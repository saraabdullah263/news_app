import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/comman/app_colors.dart';
import 'package:news_app/screens/category/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsModel});
  final Articles newsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
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
            newsModel.urlToImage ?? '',
            height: 230.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.author ?? '',
            style: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
          Text(
            newsModel.title ?? '',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeago.format(DateTime.parse(newsModel.publishedAt ?? '')),
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

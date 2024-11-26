import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/comman/widgets/error_widget.dart';
import 'package:news_app/comman/widgets/laoding_widget.dart';
import 'package:news_app/screens/category/models/news_model.dart';
import 'package:news_app/screens/category/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LaodingWidget();
        } else if (snapshot.hasError) {
          return ErroreWidget(errorMasege: snapshot.error.toString(),);
        }
        NewsModel? newsModel = snapshot.data;
        var newslist = newsModel?.articles ?? [];
        return ListView.builder(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
                  itemCount: newslist.length,
                  itemBuilder: (context, index) => NewsCard(
        newsModel: newslist[index],
                  ),
                );
      },
    );
  }
}

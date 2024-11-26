import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_consts.dart';
import 'package:news_app/screens/category/models/news_model.dart';
import 'package:news_app/screens/category/models/source_model.dart';

class ApiServices {
  static Future<SourcesModel> getSources(String categoryId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourcseEndPoints,
        {'apiKey': ApiConsts.apiKey, 'category': categoryId});
    var response = await http.get(url);
    String body = response.body;
    var json = jsonDecode(body);
    return SourcesModel.fromJson(json);
  }
    static Future<NewsModel> getNews(String sourceId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndPoints,
        {'apiKey': ApiConsts.apiKey, 'sources': sourceId});
    var response = await http.get(url);
    String body = response.body;
    var json = jsonDecode(body);
    return NewsModel.fromJson(json);
  }
  
}

import 'dart:convert';

import 'package:news_app/models/articles.dart';
import 'package:http/http.dart' as http;

import '../models/news.dart';

class NewsService {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=5e38933cbef94e87b605d59cba26ce77';
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
      return news.articles ?? [];
    }
    throw Exception('Bad Request');
  }
}
//

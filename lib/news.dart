import 'package:http/http.dart' as http;
import 'articles.dart';
import 'dart:convert';

class News {
  List<Article> news = [];

  String api_key = '8349583f1959497180c92da32025b12a';
  String headline = 'top-headlines';
  String technology = "technology";

  Future<void> getNews() async {
    String url ='https://newsapi.org/v2/${headline}?country=us&category=${technology}&apiKey=${api_key}';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
          );
          news.add(article);
        }
      });
    }
  }
}

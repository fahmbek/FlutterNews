import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:news_app_api/secret.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    // String url = 'http://newsapi.org/v2/top-headlines?country=us&apiKey=9c5eddce396d41348ca8164387d9eb73';

    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=9c5eddce396d41348ca8164387d9eb73'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }

  getCategoryNews() {}
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    // String url = 'http://newsapi.org/v2/top-headlines?country=us&apiKey=9c5eddce396d41348ca8164387d9eb73';

    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=9c5eddce396d41348ca8164387d9eb73'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element["url"],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(article);
        }
      });
    }
  }
}

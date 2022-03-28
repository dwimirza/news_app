import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

String apikey = 'fb3a0b47452f47aea68c0658765c2832';
String baseUrl = 'https://newsapi.org/v2';

class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apikey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("maaf error 404 kosong hehe siuuu");
    }
  }

  Future<List<Article>?> getNewsCategory(String category) async {
    List<Article>? list;
    String url =
        '$baseUrl/top-headlines?country=id&category=$category&apikey=$apikey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("error ga ada data");
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:elabram_flutter_news/constant/newsApi_constants.dart';
import 'package:elabram_flutter_news/model/article.dart';
import 'package:http/http.dart' as http;
import 'package:elabram_flutter_news/model/news_response.dart';

class NewsApiService {
  final http.Client client;

  NewsApiService(this.client);

  Future<List<Article>> fetchArticle() async {
    final uri = Uri.parse(
        '${NewsApiConstants.baseUrl}/everything?q=flutter&apiKey=${NewsApiConstants.apiKey}');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body)).articles;
    } else {
      throw Error();
    }
  }
}

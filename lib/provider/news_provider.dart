import 'package:flutter/cupertino.dart';
import 'package:elabram_flutter_news/model/article.dart';
import 'package:elabram_flutter_news/service/news_api_service.dart';

enum ResultState { success, failed, loading }

class NewsProvider extends ChangeNotifier {
  final NewsApiService apiService;

  List<Article> articles = [];
  ResultState state = ResultState.loading;

  NewsProvider(this.apiService);

  Future<void> loadNews() async {
    state = ResultState.loading;
    notifyListeners();

    try {
      articles = await apiService.fetchArticle();
      state = ResultState.success;
    } catch (error) {
      state = ResultState.failed;
    }

    notifyListeners();
  }
}

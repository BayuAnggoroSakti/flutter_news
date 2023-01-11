import 'dart:developer';

import 'package:elabram_flutter_news/widget/news_cards.dart';
import 'package:elabram_flutter_news/widget/web_view_news.dart';
import 'package:flutter/material.dart';
import 'package:elabram_flutter_news/provider/news_provider.dart';
import 'package:elabram_flutter_news/service/news_api_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsProvider(NewsApiService(http.Client())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NewsProvider>(context, listen: false).loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elabram News App"),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.success) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final article = provider.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebViewContainer(article.url, article.title))),
                    child: NewsCard(
                        imgUrl: article.urlToImage ?? '',
                        desc: article.description ?? '',
                        title: article.title,
                        content: article.content ?? '',
                        postUrl: article.url),
                  ),
                );
              },
              itemCount: provider.articles.length,
            );
          } else {
            return const Center(
              child: Text("Failed to fetch data"),
            );
          }
        },
      ),
    );
  }
}

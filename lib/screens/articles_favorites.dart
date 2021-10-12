import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/services/sqflite_helper.dart';
import 'package:flutter_flut/widgets/trendingCard.dart';

class ArticlesFavorites extends StatefulWidget {
  const ArticlesFavorites({Key key}) : super(key: key);

  @override
  _ArticlesFavoritesState createState() => _ArticlesFavoritesState();
}

class _ArticlesFavoritesState extends State<ArticlesFavorites> {
  bool isSearching = true;
  SqfLiteHelper _sqfLiteHelper = SqfLiteHelper();
  List<Articles> articlesList = [];
  int articlesListCount = 0;
  Future<void> getAllArticlesFavorites() async {
    articlesList = await _sqfLiteHelper.getAllArticles();

    setState(() {
      isSearching = false;
      articlesListCount = articlesList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllArticlesFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (isSearching) Center(child: CircularProgressIndicator()),
      if (!isSearching && articlesListCount == 0)
        Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.48),
            child: Center(child: Text("No articles favorites ..."))),
      if (!isSearching && articlesListCount != 0)
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 57,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TrendindCard(
                    article: articlesList[articlesListCount - 1 - index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemCount: articlesListCount),
        ),
    ]);
  }
}

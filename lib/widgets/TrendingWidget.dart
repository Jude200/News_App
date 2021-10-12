import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/models/news.dart';
import 'package:flutter_flut/services/dio_helper.dart';
import 'package:flutter_flut/widgets/trendingCard.dart';

class TrendingWidget extends StatefulWidget {
  const TrendingWidget({Key key}) : super(key: key);

  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  bool _isSearching = true;
  DioHelper _helper = DioHelper();
  List<Articles> articlesTrendingList = [];
  int articlesTrendingListCount = 0;
  Future<void> getTrendingData() async {
    _isSearching = true;
    try {
      Response<Map<String, dynamic>> searchNewsResponse =
          await _helper.searchTrending();
      Map<String, dynamic> trendingArticlesDataMap = searchNewsResponse.data;
      NewsResult trendingArticles =
          NewsResult.fromJson(trendingArticlesDataMap);
      setState(() {
        articlesTrendingList = trendingArticles.articles;
        articlesTrendingListCount = articlesTrendingList.length;
        _isSearching = false;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrendingData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_isSearching) Center(child: CircularProgressIndicator()),
        if (!_isSearching && articlesTrendingListCount == 0)
          Center(child: Text("Aucun resultat trouvé ... ")),
        if (!_isSearching && articlesTrendingListCount != 0)
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TrendindCard(article: articlesTrendingList[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: articlesTrendingListCount),
          )
      ],
    );
  }
}

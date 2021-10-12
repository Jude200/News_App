import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/models/news.dart';
import 'package:flutter_flut/screens/noInternetConnection.dart';
import 'package:flutter_flut/services/dio_helper.dart';
import 'package:flutter_flut/widgets/TrendingWidget.dart';
import 'package:flutter_flut/widgets/categoryPresentation.dart';

class ArticlesHome extends StatefulWidget {
  const ArticlesHome({Key key}) : super(key: key);

  @override
  _ArticlesHomeState createState() => _ArticlesHomeState();
}

class _ArticlesHomeState extends State<ArticlesHome> {
  TextEditingController _controller = TextEditingController();
  bool shouldValidate = false;
  DioHelper _helper = DioHelper();
  List<String> categories = ["Business", "Science", "Sports", "Entertainment"];
  List<Articles> articlesList = [];
  int articlesListCount;
  int _indexSelected = 0;
  bool _isSearching = true;

  Future<void> getData(keyword) async {
    _isSearching = true;
    try {
      Response<Map<String, dynamic>> categoryNewsResponse =
          await _helper.getCategory(keyword);
      Map<String, dynamic> categoryArticlesDataMap = categoryNewsResponse.data;
      NewsResult categoryArticles =
          NewsResult.fromJson(categoryArticlesDataMap);
      setState(() {
        articlesList = categoryArticles.articles;
        articlesListCount = articlesList.length;
        _isSearching = false;
      });
    } on DioError catch (e) {
      if (e.message.contains("SocketException")) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoInternetConnection()));
      }
    }
  }

  Future<void> getSearchData(keyword) async {
    _isSearching = true;
    try {
      Response<Map<String, dynamic>> categoryNewsResponse =
          await _helper.searchNews(keyword);
      Map<String, dynamic> categoryArticlesDataMap = categoryNewsResponse.data;
      NewsResult categoryArticles =
          NewsResult.fromJson(categoryArticlesDataMap);
      setState(() {
        articlesList = categoryArticles.articles;
        articlesListCount = articlesList.length;
        _isSearching = false;
      });
    } on DioError catch (e) {
      if (e.message.contains("SocketException")) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoInternetConnection()));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData(categories[0]);
    //  print(g);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 8.0),
            child: TextFormField(
              controller: _controller,
              onSaved: (value) {
                if (value.trim().length == 0) {
                  return 'Error';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon: IconButton(
                  onPressed: () async {
                    print(_controller.text);
                    getSearchData(_controller.text);
                  },
                  icon: Icon(Icons.search),
                ),
                hintText: "Enter keywords ... ",
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _indexSelected = index;
                        getData(categories[_indexSelected]);
                      });
                    },
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        letterSpacing: 1.2,
                        color: index == _indexSelected
                            ? Colors.black
                            : Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 15);
              },
              itemCount: categories.length),
        ),
        if (_isSearching)
          Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              child: Center(child: CircularProgressIndicator())),
        if (!_isSearching && articlesListCount == 0)
          Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              child: Center(child: Text("Aucun article trouvé "))),
        if (!_isSearching && articlesListCount != 0)
          CategoryPresentation(articles: articlesList),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Text("Trending"),
              ),
            ],
          ),
        ),
        TrendingWidget()
      ],
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/models/news.dart';
import 'package:flutter_flut/services/dio_helper.dart';
import 'package:flutter_flut/widgets/categoryPresentation.dart';
import 'package:flutter_flut/widgets/search.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DioHelper _helper = DioHelper();
  List<Articles> articlesList = [];
  int articlesListCount;
  int _indexTap = 0;

  Future<void> getData(category) async {
    Response<Map<String, dynamic>> categoryNewsResponse =
        await _helper.getCategory(category);
    Map<String, dynamic> categoryArticlesDataMap = categoryNewsResponse.data;
    NewsResult categoryArticles = NewsResult.fromJson(categoryArticlesDataMap);
    setState(() {
      articlesList = categoryArticles.articles;
      articlesListCount = articlesList.length;
    });
  }

  @override
  void initState() {
    super.initState();
    var g = getData('sports');
    print(g);
  }

  void _handleTabTap(int i) {
    setState(() {
      _indexTap = i;
    });
  }

  List<String> categories = ["All ", "Fashions", "Sports", "Entaintment"];
  int _indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Search(),
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
          CategoryPresentation(),
        ],
      ),
      bottomNavigationBar: bottomAppBarWidget(),
    );
  }

  BottomNavigationBar bottomAppBarWidget() {
    return BottomNavigationBar(
      backgroundColor: mainColor,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black38,
      onTap: _handleTabTap,
      currentIndex: _indexTap,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.pin_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
      ],
    );
  }
}

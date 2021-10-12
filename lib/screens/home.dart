import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/screens/articles_favorites.dart';
import 'package:flutter_flut/screens/homeArticles.dart';
import 'package:flutter_flut/screens/user.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexTap = 0;

  void _handleTabTap(int i) {
    setState(() {
      _indexTap = i;
      //  print(articlesListCount);
    });
  }

  List<Widget> _bottomWidget = [
    ArticlesHome(),
    ArticlesFavorites(),
    UserDetail()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: mainColor,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.black,
          onTap: _handleTabTap,
          iconSize: 26,
          currentIndex: _indexTap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
          ],
        ),
        body: _bottomWidget[_indexTap]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/screens/signin.dart';
import 'package:flutter_flut/services/auth_helper.dart';
import 'package:flutter_flut/services/get.dart';
import 'package:flutter_flut/services/sqflite_helper.dart';
import 'package:get/get.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key key}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  AuthentificationHelper _helper;
  Controller controller = Get.put(Controller());
  var count = 0.obs;
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
    _helper = AuthentificationHelper(context);
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text("Read Articles",
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              ),
              SizedBox(width: 1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text(count.toString(),
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text("safe offline articles ",
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              ),
              SizedBox(width: 1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text(articlesListCount.toString(),
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text("Saved online articles ",
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              ),
              SizedBox(width: 1),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(color: mainColor),
                child: Text("08 ",
                    style: TextStyle(fontFamily: 'Mogra', color: Colors.white)),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFFDDF2EF)),
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 40)),
              ),
              onPressed: () {
                Get.to(SignIn());
              },
              child: Text("Sign in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      fontSize: 20))),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0XFFDDF2EF)),
                minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 40)),
              ),
              onPressed: () async {
                await _helper.signOut();
              },
              child: Text("Sign out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                      fontSize: 20))),
        ),
      ],
    );
  }
}

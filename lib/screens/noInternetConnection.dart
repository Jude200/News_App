import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/screens/homeArticles.dart';
import 'package:get/get.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/images/noInternet.jpg"),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text("Pas de connexion Internet. Veillez reéssayer ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      onPressed: () {
                        Get.to(ArticlesHome());
                      },
                      child: Text("Try again "),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Bo to back"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/services/exchange.dart';
import 'package:flutter_flut/services/sqflite_helper.dart';
import 'package:get/state_manager.dart';

class ArticleDetails extends StatefulWidget {
  final Articles article;
  const ArticleDetails({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  Future<void> _lauched;
  SqfLiteHelper _sqflite = SqfLiteHelper();
  var isExist = false.obs;
  Articles a;

  Future<void> exist() async {
    a = await _sqflite.getArticle(widget.article.title);
    if (a == null) {
      isExist.value = false;
    } else {
      isExist.value = true;
    }
    print(isExist);
  }

  @override
  void initState() {
    super.initState();
    exist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                // SizedBox(height: 15),
                /* Container(
                  width: double.infinity,
                  child: Text("Author : ${widget.article.author} ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ), */

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.article.title,
                    style: TextStyle(fontFamily: 'Mogra', fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CachedNetworkImage(
                    height: 150,
                    fit: BoxFit.cover,
                    imageUrl: widget.article.urlToImage,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.article.description,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  child: Text("Source : ${widget.article.source.name} ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                          if (!isExist.value) {
                            await _sqflite.insert(widget.article);
                            setState(() {});
                          } else {
                            await _sqflite.delete(widget.article.title);
                            setState(() {});
                          }
                        },
                        icon: isExist.value
                            ? Icon(Icons.delete_outline)
                            : Icon(Icons.favorite_outline),
                        label: !isExist.value
                            ? Text("Ajouter aux favoris ")
                            : Text("Supprimer des favoris ")),
                    ElevatedButton(
                        onPressed: () {
                          _lauched = launchInBrowser(widget.article.url);
                        },
                        child: Text("Voir plus ...")),
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

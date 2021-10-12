import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/screens/details.dart';
import 'package:flutter_flut/services/exchange.dart';
import 'package:flutter_flut/services/sqflite_helper.dart';

class TrendindCard extends StatefulWidget {
  final Articles article;
  const TrendindCard({Key key, @required this.article}) : super(key: key);

  @override
  _TrendindCardState createState() => _TrendindCardState();
}

class _TrendindCardState extends State<TrendindCard> {
  SqfLiteHelper _sqfLiteHelper = SqfLiteHelper();
  bool isExist = false;
  Articles a;
  Future<void> exist() async {
    a = await _sqfLiteHelper.getArticle(widget.article.title);
    if (a == null) {
      setState(() {
        isExist = false;
      });
    } else {
      setState(() {
        isExist = true;
      });
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
    return Container(
      width: 350,
      height: 160,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 5.2,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetails(article: widget.article)));
              },
              child: CachedNetworkImage(
                width: 100,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: widget.article.urlToImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              width: 160,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      widget.article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Text(
                      widget.article.author != null
                          ? widget.article.source.name
                          : "Author",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await _sqfLiteHelper.delete(widget.article.title);
                            setState(() {
                              print(widget.article.title);
                            });
                          },
                          icon: isExist
                              ? Icon(Icons.delete_outlined, color: mainColor)
                              : Icon(Icons.share_outlined)),
                      IconButton(
                          onPressed: () async {
                            Articles a = await _sqfLiteHelper
                                .getArticle(widget.article.title);
                            if (a == null) {
                              await _sqfLiteHelper.insert(widget.article);
                            } else {
                              print('Deja enregistré');
                            }
                          },
                          icon: isExist
                              ? Icon(Icons.favorite, color: mainColor)
                              : Icon(
                                  Icons.favorite_outline,
                                  color: mainColor,
                                )),
                    ],
                  ),
                  Text(formatedDate(widget.article.publishedAt)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

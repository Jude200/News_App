import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';
import 'package:flutter_flut/screens/details.dart';
import 'package:flutter_flut/services/sqflite_helper.dart';

class CategoryCard extends StatefulWidget {
  final Articles articles;

  const CategoryCard({Key key, @required this.articles}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  Articles a;
  bool isExist = false;
  SqfLiteHelper _sqfLiteHelper = SqfLiteHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 12,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetails(article: widget.articles)));
              },
              child: CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: widget.articles.urlToImage,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.articles.description == null
                    ? ''
                    : widget.articles.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 70,
                    child: Text(
                      widget.articles.author != null
                          ? widget.articles.source.name
                          : "Author",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.share_outlined)),
                  IconButton(
                      onPressed: () async {
                        a = await _sqfLiteHelper
                            .getArticle(widget.articles.title);
                        if (isExist == null) {
                          await _sqfLiteHelper.insert(widget.articles);
                        }
                      },
                      icon: Icon(Icons.favorite_outline)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

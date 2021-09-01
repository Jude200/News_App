import 'package:flutter/material.dart';
import 'package:flutter_flut/models/article.dart';

class CategoryCard extends StatefulWidget {
  final Articles articles;
  const CategoryCard({Key key, @required this.articles}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 12,
        child: Column(
          children: [
            Image.asset(widget.articles.urlToImage,
                width: double.infinity, height: 120, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.articles.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                  ),
                  Text(widget.articles.author),
                  IconButton(onPressed: () {}, icon: Icon(Icons.flutter_dash)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

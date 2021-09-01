import 'package:flutter/material.dart';
import 'package:flutter_flut/models/data.dart';
import 'package:flutter_flut/widgets/categoryCard.dart';

class CategoryPresentation extends StatefulWidget {
  const CategoryPresentation({Key key}) : super(key: key);

  @override
  _CategoryPresentationState createState() => _CategoryPresentationState();
}

class _CategoryPresentationState extends State<CategoryPresentation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryCard(articles: articles[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemCount: articles.length),
    );
  }
}

import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String keyWord;
  const SearchWidget({Key key, @required this.keyWord}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text(widget.keyWord), Text("More ... ")])
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 8.0),
        child: TextFormField(
            decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          hintText: "Enter keywords ... ",
        )),
      ),
    );
  }
}

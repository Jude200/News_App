import 'package:flutter/material.dart';
import 'package:flutter_flut/packge/interface.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
        primarySwatch: Colors.blue,
      ),
      home: EpSmart(),
    );
  }
}

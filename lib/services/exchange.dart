import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_save/image_save.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> createNewsImagesFolder() async {
  final foldername = 'News_images';
  final path = Directory("storage/emulated/0/$foldername");
  if (await path.exists()) {
    print('Folder exist');
  } else {
    path.create();
  }
}

getImage(urlImage) async {
  Response<List<int>> res = await Dio()
      .get(urlImage, options: Options(responseType: ResponseType.bytes));
  return Uint8List.fromList(res.data);
}

Future<void> saveNewsImage(urlImage) async {
  bool success = false;

  try {
    success = await ImageSave.saveImage(getImage(urlImage), 'jjjjjj.png');
  } on PlatformException catch (e, s) {
    print(e);
    print(s);
  }
}
/* Ouverture des liens sur un broswer */

Future<void> launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

String formatedDate(date) {
  String dte = date.substring(0, date.indexOf('T'));
  String hour = date.substring(date.indexOf('T') + 1, date.indexOf('Z'));

  String year = dte.substring(0, dte.indexOf('-'));
  String mD = dte.substring(dte.indexOf('-') + 1);
  String month = mD.substring(0, mD.indexOf('-'));
  String day = mD.substring(mD.indexOf('-') + 1);

  return '$day-$month-$year  $hour';
}

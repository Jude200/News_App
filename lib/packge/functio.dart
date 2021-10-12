import 'package:flutter/material.dart';
import 'package:flutter_flut/packge/data.dart';

List<List<String>> keyValDepart(Map<String, String> map) {
  List<List<String>> _list = [[], []];

  map.forEach((key, value) {
    _list[0].add(key);
    _list[1].add(value);
  });
  print(_list);
  return _list;
}

List<List<String>> keyValCommon(String _key) {
  List<List<String>> _list = [[], []];

  Map<String, String> commonDepartSelect = common[_key];
  commonDepartSelect.forEach((key, value) {
    _list[0].add(key);
    _list[1].add(value);
  });
  print(_list);
  return _list;
}

List<List<String>> keyValDistrict(String _key) {
  List<List<String>> _list = [[], []];

  Map<String, String> commonDepartSelect = district[_key];
  commonDepartSelect.forEach((key, value) {
    _list[0].add(key);
    _list[1].add(value);
  });

  return _list;
}

List<DropdownMenuItem<String>> f(List<String> l) {
  return l
      .map((String e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();
}

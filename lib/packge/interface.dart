import 'package:flutter/material.dart';
import 'package:flutter_flut/packge/data.dart';
import 'package:flutter_flut/packge/functio.dart';

class EpSmart extends StatefulWidget {
  const EpSmart({Key key}) : super(key: key);

  @override
  _EpSmartState createState() => _EpSmartState();
}

class _EpSmartState extends State<EpSmart> {
  /* Variable concernant les departements */
  static final _listDepartment = keyValDepart(department);
  String _valDepart = _listDepartment[1][0];
  static int _indexDepart = _listDepartment[1].indexOf(_listDepartment[1][0]);
  static String _keyDepart =
      _listDepartment[1][_listDepartment[1].indexOf(_listDepartment[1][0])];
  final _dropListDepart = f(_listDepartment[1]);

  /* Variable concernant les comunes */
  static var _listCommon = keyValCommon(_keyDepart);
  String _valCommon = _listCommon[1][0];
  final _dropListCommon = f(_listCommon[1]);
  static int _indexCommon = _listCommon[1].indexOf(_listCommon[1][0]);
  static String _keyCommon =
      _listCommon[1][_listCommon[1].indexOf(_listCommon[1][0])];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
          ),
          Container(
            child: DropdownButton(
              icon: Icon(Icons.local_fire_department),
              value: _valDepart,
              onChanged: (newVal) {
                setState(() {
                  _valDepart = newVal;
                  _indexDepart = _listDepartment[1].indexOf(newVal);
                  _keyDepart = _listDepartment[0][_indexDepart];
                  _listCommon = keyValCommon(_keyDepart);
                  print(_keyDepart);
                });
              },
              items: this._dropListDepart,
            ),
          ),
          Container(
            child: DropdownButton(
              icon: Icon(Icons.local_fire_department),
              value: _valCommon,
              onChanged: (newVal) {
                setState(() {
                  _valCommon = newVal;
                  _indexCommon = _listCommon[1].indexOf(newVal);
                  //  _keyCommon = _listCommon[0][_indexCommon];
                  print(_keyCommon);
                });
              },
              items: this._dropListCommon,
            ),
          )
        ],
      ),
    );
  }
}

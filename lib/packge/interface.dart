import 'package:flutter/material.dart';

import 'package:flutter_flut/packge/data.dart';
import 'package:flutter_flut/packge/functio.dart';

class EpSmart extends StatefulWidget {
  final bool isRow;
  final Icon departmentIcon;
  final Icon commonIcon;
  final Icon districtIcon;
  final double iconSize;
  final double width;

  const EpSmart(
      {Key key,
      this.width = 90,
      this.isRow = false,
      this.departmentIcon,
      this.commonIcon,
      this.districtIcon,
      this.iconSize = 24})
      : super(key: key);

  @override
  _EpSmartState createState() => _EpSmartState();
}

class _EpSmartState extends State<EpSmart> {
  /* Variable concernant les departements */
  static final _listDepartment =
      keyValDepart(department); // list de list des clés et des departements
  String _valDepart = _listDepartment[1][0]; // recupération des departements
  static int _indexDepart = _listDepartment[1].indexOf(_listDepartment[1]
      [0]); // index du 1er departement (pour retrouver sa clé)
  static String _keyDepart =
      _listDepartment[0][_indexDepart]; // cle du 1er departement
  final _dropListDepart =
      f(_listDepartment[1]); // dropMenuItem pour le departement

  /* Variable concernant les communes */
  static List _listCommon = keyValCommon(_keyDepart);
  String _valCommon = _listCommon[1][0];
  static List<DropdownMenuItem<String>> _dropListCommon = f(_listCommon[1]);
  List<DropdownMenuItem<String>> k =
      _dropListCommon; // J'ai utilisé une autre variable k pour les items parce que les items ne peuvent pas etre assigné a une variable de type static
  static int _indexCommon = _listCommon[1].indexOf(_listCommon[1][0]);
  static String _keyCommon = _listCommon[0][_indexCommon];

/*Variable concernant les districts*/
  static List _listDistrict = keyValDistrict(_keyCommon);
  String _valDistrict = _listDistrict[1][0];
  static List<DropdownMenuItem<String>> _dropListDistrict = f(_listDistrict[1]);
  List<DropdownMenuItem<String>> j =
      _dropListDistrict; // J'ai utilisé une autre variable k pour les items parce que les items ne peuvent pas etre assigné a une variable de type static
  static int _indexDistrict = _listDistrict[1].indexOf(_listDistrict[1][0]);
  static String _keyDistrict = _listDistrict[0][_indexDistrict];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !widget.isRow
            ? Column(
                children: [
                  Container(
                    width: widget.width,
                    child: DropdownButton(
                      icon: widget.departmentIcon,
                      iconSize: widget.iconSize,
                      value: _valDepart,
                      onChanged: (newVal) {
                        setState(() {
                          /* On reinitialise toutes les variable permettant d'afficher le dropdownbutton des communes */
                          _valDepart = newVal;
                          _indexDepart = _listDepartment[1].indexOf(newVal);
                          /* Mise a jour Common */
                          _keyDepart = _listDepartment[0][_indexDepart];
                          _listCommon = keyValCommon(_keyDepart);
                          _valCommon = _listCommon[1][0];
                          _dropListCommon = f(_listCommon[1]);
                          _indexCommon =
                              _listCommon[1].indexOf(_listCommon[1][0]);
                          _keyCommon = _listCommon[0][_indexCommon];
                          k = _dropListCommon;
                          /* Mise a jour District */
                          _listDistrict = keyValDistrict(_keyCommon);
                          _valDistrict = _listDistrict[1][0];
                          _dropListDistrict = f(_listDistrict[1]);
                          j = _dropListDistrict;
                          print(_valDistrict);
                        });
                      },
                      items: this._dropListDepart,
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      icon: widget.commonIcon,
                      iconSize: widget.iconSize,
                      value: _valCommon,
                      onChanged: (newVal) {
                        setState(() {
                          _valCommon = newVal;
                          _indexCommon = _listCommon[1].indexOf(newVal);
                          _keyCommon = _listCommon[0][_indexCommon];
                          /* mise a jour */
                          _listDistrict = keyValDistrict(_keyCommon);
                          _valDistrict = _listDistrict[1][0];
                          _dropListDistrict = f(_listDistrict[1]);
                          j = _dropListDistrict;
                          print(_keyCommon);
                        });
                      },
                      items: k,
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      icon: widget.districtIcon,
                      iconSize: widget.iconSize,
                      value: _valDistrict,
                      onChanged: (newVal) {
                        setState(() {
                          _valDistrict = newVal;
                        });
                      },
                      items: j,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    width: widget.width,
                    child: DropdownButton(
                      icon: widget.departmentIcon,
                      iconSize: widget.iconSize,
                      value: _valDepart,
                      onChanged: (newVal) {
                        setState(() {
                          /* On reinitialise toutes les variable permettant d'afficher le dropdownbutton des communes */
                          _valDepart = newVal;
                          _indexDepart = _listDepartment[1].indexOf(newVal);
                          /* Mise a jour Common */
                          _keyDepart = _listDepartment[0][_indexDepart];
                          _listCommon = keyValCommon(_keyDepart);
                          _valCommon = _listCommon[1][0];
                          _dropListCommon = f(_listCommon[1]);
                          _indexCommon =
                              _listCommon[1].indexOf(_listCommon[1][0]);
                          _keyCommon = _listCommon[0][_indexCommon];
                          k = _dropListCommon;
                          /* Mise a jour District */
                          _listDistrict = keyValDistrict(_keyCommon);
                          _valDistrict = _listDistrict[1][0];
                          _dropListDistrict = f(_listDistrict[1]);
                          j = _dropListDistrict;
                          print(_valDistrict);
                        });
                      },
                      items: this._dropListDepart,
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      icon: widget.commonIcon,
                      iconSize: widget.iconSize,
                      value: _valCommon,
                      onChanged: (newVal) {
                        setState(() {
                          _valCommon = newVal;
                          _indexCommon = _listCommon[1].indexOf(newVal);
                          _keyCommon = _listCommon[0][_indexCommon];
                          /* mise a jour */
                          _listDistrict = keyValDistrict(_keyCommon);
                          _valDistrict = _listDistrict[1][0];
                          _dropListDistrict = f(_listDistrict[1]);
                          j = _dropListDistrict;
                          print(_keyCommon);
                        });
                      },
                      items: k,
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      icon: widget.districtIcon,
                      iconSize: widget.iconSize,
                      value: _valDistrict,
                      onChanged: (newVal) {
                        setState(() {
                          _valDistrict = newVal;
                        });
                      },
                      items: j,
                    ),
                  ),
                ],
              ));
  }

/*   void valueSelected(department, common, district) {
    department = _valDepart;
    common = _valCommon;
    district = _valDistrict;
  } */
}

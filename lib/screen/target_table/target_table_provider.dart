import 'package:dream/screen/target_table/target_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TargetTableProvider with ChangeNotifier {
  bool isCheckedTarget = false;
  final _tagetTables = [
    TargetModel(
        color: Color(0xFF43CD80),
        title: 'Relationship',
        icon: Icon(Icons.family_restroom)),
    TargetModel(
        color: Color(0xFFffba00), title: 'Health', icon: Icon(Icons.favorite)),
    TargetModel(
        color: Color(0xFF0f52ba), title: 'Education', icon: Icon(Icons.school)),
    TargetModel(
        color: Color(0xFFf4a460),
        title: 'Self',
        icon: Icon(Icons.perm_identity)),
    TargetModel(
        color: Color(0xFF54ff9f),
        title: 'Work',
        icon: Icon(Icons.business_center)),
    TargetModel(
        color: Color(0xFFff2400), title: 'Money', icon: Icon(Icons.favorite)),
  ];

  List<TargetModel> get targetTables => _tagetTables;

  void setCheckedTable(bool isNewCheckedTarget) {
    isCheckedTarget = isNewCheckedTarget;
    notifyListeners();
  }

  void setColorTable(Color setColor, int index) {
    targetTables[index].color = setColor;
    notifyListeners();
  }
}

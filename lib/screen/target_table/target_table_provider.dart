import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TargetTableProvider extends ChangeNotifier {
  bool isCheckedTarget = false;

  void setCheckedTable(bool isNewCheckedTarget) {
    isCheckedTarget = isNewCheckedTarget;
    notifyListeners();
  }
}

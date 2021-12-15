import 'dart:core';
import 'dart:io';
import 'package:flutter/foundation.dart';

class AccountProvider extends ChangeNotifier {
  late final File _image;

  DateTime _date = DateTime.now();

  DateTime get date => _date;

  File? get image => _image;

  Future setImage(var imagePicker) async {
    _image = imagePicker;
    notifyListeners();
  }

  void setDate(DateTime isNewDate) {
    _date = isNewDate;
    notifyListeners();
  }
}

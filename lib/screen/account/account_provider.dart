import 'dart:core';
import 'dart:io';
import 'package:dream/screen/account/account_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const nameKey = 'name';
const birthKey = 'birthDay';
const Year = 'year';
const imagKey = 'image';

class AccountProvider extends ChangeNotifier {
  File? _image;

  DateTime _date = DateTime.now();

  DateTime get date => _date;

  File? get image => _image;

  Account? _account;
  Account? get account => _account;

  Future setImage(File? imagePicker) async {
    _image = imagePicker;
    notifyListeners();
  }

  void setDate(DateTime isNewDate) {
    _date = isNewDate;
    notifyListeners();
  }

  Future<void> getAccountInfo() async {
    final preferences = await SharedPreferences.getInstance();
    final name = preferences.getString(nameKey);
    final birthDay = preferences.getString(birthKey);
    final year = preferences.getString(Year);
    final imageAvata = preferences.getString(imagKey);
    final newacc = Account(
      name: name,
      birthDay: birthDay,
      year: year,
      avataAccount: imageAvata,
    );
    _account = newacc;
    notifyListeners();
  }
}

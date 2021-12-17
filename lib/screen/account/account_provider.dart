import 'dart:core';
import 'dart:io';
import 'package:dream/screen/account/account_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const NAME_KEY = 'name';
const BIRTHDAY_KEY = 'birthDay';
const YEAR = 'year';
const IMAGE_KEY = 'image';

class AccountProvider extends ChangeNotifier {
  File? _image;

  DateTime _date = DateTime.now();

  DateTime get date => _date;

  File? get image => _image;

  Account? _account;
  Account? get account => _account;

  Future setImage(var imagePicker) async {
    _image = imagePicker;
    notifyListeners();
  }

  void setDate(DateTime isNewDate) {
    _date = isNewDate;
    notifyListeners();
  }

  Future<void> getAccountInfo() async {
    final preferences = await SharedPreferences.getInstance();
    final name = preferences.getString(NAME_KEY);
    final birthDay = preferences.getString(BIRTHDAY_KEY);
    final year = preferences.getString(YEAR);
    final imageAvata = preferences.getString(IMAGE_KEY);
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

import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = new Locale('en', 'US');

  Locale get currentLocale => _currentLocale;
  void changeLocale(String _locale, String s) {
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }
}

import 'package:dream/screen/option/language_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const languageKey = 'language';
// const String VIETNAM = 'vi';
const languageCodeKey = 'languageCode';

class LanguageProvider extends ChangeNotifier {
  Language? _language;
  Locale _currentLocale = new Locale(languageKey, languageCodeKey);

  Locale get currentLocale => _currentLocale;
  Language? get language => _language;

  void changeLocale(String _locale, String s) {
    this._currentLocale = new Locale(_locale);
    notifyListeners();
  }

  Future<void> getLocale() async {
    final preferences = await SharedPreferences.getInstance();

    final language = preferences.getString(languageKey);
    final languageCode = preferences.getString(languageCodeKey);

    print(languageCode);
    final newLanguage =
        Language(language: language, languageCode: languageCode);
    _language = newLanguage;
    notifyListeners();
  }
}

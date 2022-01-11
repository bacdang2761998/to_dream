import 'dart:ui';

import 'package:dream/screen/option/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

class LanguageStateNotifer extends StateNotifier<LanguageState> {
  LanguageStateNotifer() : super(LanguageState());

  Future<bool> saveLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('language', langCode);
  }

  Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString('language');
  }

  void toVietnames() {
    state = LanguageState(currentLocale: Locale('vi'));
    saveLanguage('vi');
  }

  void toEnglish() {
    state = LanguageState(currentLocale: Locale('en'));
    saveLanguage('en');
  }
}

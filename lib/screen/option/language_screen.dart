import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/option/language_model.dart';
import 'package:dream/screen/option/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // final language = Language();
  static List<Language> languages = [
    Language(language: 'vi', languageCode: 'VN'),
    Language(language: 'en', languageCode: 'US'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).lagugeSettingtitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Vietnames",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .getLocale();

                context.read<LanguageProvider>().changeLocale(
                    '${languages[0].language}', '${languages[0].languageCode}');
                setLocale();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "English",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .getLocale();

                context.read<LanguageProvider>().changeLocale(
                    '${languages[1].language}', '${languages[1].languageCode}');
                setLocale();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void setLocale() async {
  final language = Language();
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString(languageKey, language.language.toString());
  await preferences.setString(
      languageCodeKey, language.languageCode.toString());
}

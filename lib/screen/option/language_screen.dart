import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/option/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
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
                context.read<LanguageProvider>().changeLocale('vi', 'VN');
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "English",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                context.read<LanguageProvider>().changeLocale('en', 'US');
              },
            ),
          ],
        ),
      ),
    );
  }
}

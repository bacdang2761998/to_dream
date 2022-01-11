import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/option/langague_state_notifier.dart';
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
    final locale = S.of(context);
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
                locale.vN,
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                context.read<LanguageStateNotifer>().toVietnames();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                locale.english,
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                context.read<LanguageStateNotifer>().toEnglish();
              },
            ),
          ],
        ),
      ),
    );
  }
}

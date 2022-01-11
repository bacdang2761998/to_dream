import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/bottom_bar/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: AlertDialog(
            title: Text(locale.createNew),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        clearData();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => CreateAccount()),
                            (route) => false);
                      },
                      child: Text(locale.yes)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => BottomBar()),
                            (route) => false);
                      },
                      child: Text(locale.no)),
                ],
              )
            ],
          ),
        ));
  }

  void clearData() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}

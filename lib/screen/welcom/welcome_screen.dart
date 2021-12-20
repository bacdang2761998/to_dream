import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/bottom_bar/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        body: Center(
          child: AlertDialog(
            title: const Text("Do you want to create a new account ?"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        clearData();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CreateAccount()),
                            (route) => false);
                      },
                      child: const Text(" Yes")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BottomBar()),
                            (route) => false);
                      },
                      child: const Text(" No")),
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

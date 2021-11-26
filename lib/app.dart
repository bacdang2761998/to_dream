import 'package:dream/screen/account/create_account.dart';
import 'package:dream/screen/introlduction/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IntroProvider()),
        ChangeNotifierProvider(create: (context) => CreateProvider()),
      ],
      child: MaterialApp(
        title: 'To Dream',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          unselectedWidgetColor: Colors.white,
        ),
        home: IntroScreen(),
      ),
    );
  }
}

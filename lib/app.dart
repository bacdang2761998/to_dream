import 'package:dream/screen/account/account_provider.dart';
import 'package:dream/screen/introlduction/intro_screen.dart';
import 'package:dream/screen/introlduction/introl_provider.dart';
import 'package:dream/screen/option/option_provider.dart';
import 'package:dream/screen/target_table/target_table_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OptionProvider()),
        ChangeNotifierProvider(create: (_) => IntroProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => TargetTableProvider()),
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

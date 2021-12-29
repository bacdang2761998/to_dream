import 'package:dream/screen/option/language_provider.dart';
import 'package:dream/screen/account/account_provider.dart';
import 'package:dream/screen/introlduction/intro_screen.dart';
import 'package:dream/screen/introlduction/introl_provider.dart';
import 'package:dream/screen/introlduction/introl_state.dart';
import 'package:dream/screen/introlduction/introl_state_notifier.dart';
import 'package:dream/screen/target_table/target_table_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<IntrolStateNotifier, IntrolState>(
            create: (_) => IntrolStateNotifier()),
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => IntroProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => TargetTableProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (_, model, child) => MaterialApp(
          locale: model.currentLocale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'To Dream',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            unselectedWidgetColor: Colors.white,
          ),
          home: IntroScreen(),
        ),
      ),
    );
  }
}

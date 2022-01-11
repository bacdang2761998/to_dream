import 'package:dream/screen/account/account_state.dart';
import 'package:dream/screen/account/account_state_notifier.dart';
import 'package:dream/screen/introlduction/intro_screen.dart';
import 'package:dream/screen/introlduction/introl_state.dart';
import 'package:dream/screen/introlduction/introl_state_notifier.dart';
import 'package:dream/screen/option/langague_state_notifier.dart';
import 'package:dream/screen/option/language_state.dart';
import 'package:dream/screen/target_table/target_table_state.dart';
import 'package:dream/screen/target_table/target_table_state_notifier.dart';
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
        StateNotifierProvider<TargetTableStateNotifier, TargetTableState>(
            create: (_) => TargetTableStateNotifier()),
        StateNotifierProvider<AccountStateNotifier, AccountState>(
            create: (_) => AccountStateNotifier()),
        StateNotifierProvider<LanguageStateNotifer, LanguageState>(
            create: (_) => LanguageStateNotifer()),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.watch<LanguageState>().currentLocale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
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

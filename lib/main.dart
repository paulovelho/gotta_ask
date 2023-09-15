import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gotta_ask/database/bootstrap.dart';
import 'package:gotta_ask/pages/homepage.dart';
import 'package:gotta_ask/state.dart';
import 'package:gotta_ask/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Bootstrap().install();
  runApp(EasyLocalization(
    path: "assets/translations",
    supportedLocales: const [
      Locale('pt'),
      Locale('en'),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: platypusTheme(),
        home: const HomePage(title: "Gotta Ask"),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}

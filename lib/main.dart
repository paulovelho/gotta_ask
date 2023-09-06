import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/homepage.dart';
import 'package:gotta_ask/state.dart';
import 'package:gotta_ask/theme.dart';

void main() {
  runApp(const MyApp());
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
        home: const HomePage(title: 'Gotta Ask'),
      ),
    );
  }
}

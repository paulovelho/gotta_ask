import 'package:flutter/material.dart';
import 'package:gotta_ask/deck/deck-page.dart';
import 'package:gotta_ask/shortcuts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
//    required this.keyboard,
  });
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShortcutsWidget(
        page: CardPage(),
      ),
    );
  }
}

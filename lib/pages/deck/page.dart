import 'package:flutter/material.dart';
import 'package:gotta_ask/pages/deck/deck_shortcuts.dart';
import 'package:gotta_ask/pages/deck/deck.dart';

class CardPage extends StatelessWidget {
  const CardPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
          padding: EdgeInsets.all(26),
          child: DeckShortcutsWidget(page: Deck())),
    );
  }
}

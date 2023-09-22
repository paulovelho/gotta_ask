import 'package:flutter/material.dart';
import 'package:gotta_ask/pages/deck/deck.dart';
import 'package:gotta_ask/pages/deck/deck_controls.dart';

class DeckPage extends StatelessWidget {
  const DeckPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Deck(),
            ),
            DeckControl(),
          ],
        ),
      ),
    );
  }
}

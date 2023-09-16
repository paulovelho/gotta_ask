import 'package:flutter/material.dart';
import 'package:gotta_ask/pages/preferences/page.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/state.dart';

class DeckControl extends StatefulWidget {
  const DeckControl({
    Key? key,
  }) : super(key: key);

  @override
  State<DeckControl> createState() => DeckControlWidget();
}

class DeckControlWidget extends State<DeckControl> {
  _openPreferences(BuildContext context) async {
    var res = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Hero(
          tag: "favorites",
          child: PreferencesPage(),
        ),
      ),
    );
    if (res != null && res == true) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = appState.controller;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "undo",
            onPressed: controller.unswipe,
            child: const Icon(Icons.rotate_left),
          ),
          FloatingActionButton(
            heroTag: "left",
            onPressed: controller.swipeLeft,
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          FloatingActionButton(
            heroTag: "right",
            onPressed: controller.swipeRight,
            child: const Icon(Icons.keyboard_arrow_right),
          ),
          FloatingActionButton(
            heroTag: "top",
            onPressed: controller.swipeUp,
            child: const Icon(Icons.keyboard_arrow_up),
          ),
          FloatingActionButton(
            heroTag: "fav",
            child: const Icon(Icons.menu),
            onPressed: () => _openPreferences(context),
          ),
        ],
      ),
    );
  }
}

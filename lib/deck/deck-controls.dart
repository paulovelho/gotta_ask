import 'package:flutter/material.dart';
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
            onPressed: controller.undo,
            child: const Icon(Icons.rotate_left),
          ),
          FloatingActionButton(
            onPressed: controller.swipe,
            child: const Icon(Icons.rotate_right),
          ),
          FloatingActionButton(
            onPressed: controller.swipeLeft,
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          FloatingActionButton(
            onPressed: controller.swipeRight,
            child: const Icon(Icons.keyboard_arrow_right),
          ),
          FloatingActionButton(
            onPressed: controller.swipeTop,
            child: const Icon(Icons.keyboard_arrow_up),
          ),
          FloatingActionButton(
            onPressed: controller.swipeBottom,
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}

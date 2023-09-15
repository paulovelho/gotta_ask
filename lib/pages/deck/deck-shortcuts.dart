import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gotta_ask/state.dart';

class DeckShortcutsWidget extends StatefulWidget {
  const DeckShortcutsWidget({
    super.key,
    required this.page,
  });
  final Widget page;

  @override
  State<DeckShortcutsWidget> createState() => _DeckShortcutsWidget();
}

class _DeckShortcutsWidget extends State<DeckShortcutsWidget> {
  FocusNode focusNode = FocusNode();
  late CardSwiperController controller;

  void shortcutManager(LogicalKeyboardKey key) {
    switch (key) {
      case LogicalKeyboardKey.arrowUp:
        controller.swipeTop();
        break;
      case LogicalKeyboardKey.arrowDown:
        controller.swipeBottom();
        break;
      case LogicalKeyboardKey.arrowLeft:
        controller.swipeLeft();
        break;
      case LogicalKeyboardKey.arrowRight:
        controller.swipeRight();
        break;
      case LogicalKeyboardKey.keyR:
        controller.undo();
        break;
    }
  }

  void handleKey(RawKeyEvent event) {
    if (event.runtimeType.toString() == 'RawKeyDownEvent') {
      shortcutManager(event.data.logicalKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    var appState = context.watch<AppState>();
    controller = appState.controller;

    return Scaffold(
      body: RawKeyboardListener(
          focusNode: focusNode, onKey: handleKey, child: widget.page),
    );
  }
}

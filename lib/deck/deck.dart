import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gotta_ask/deck/deck-controls.dart';
import 'package:gotta_ask/shortcuts.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/deck/questions/question-card.dart';
import 'package:gotta_ask/state.dart';
import 'deck-builder/list.dart';

class Deck extends StatefulWidget {
  const Deck({
    Key? key,
  }) : super(key: key);

  @override
  State<Deck> createState() => DeckPage();
}

class DeckPage extends State<Deck> {
  final cards = questions.map(QuestionCard.new).toList();
  late CardSwiperController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    controller = appState.controller;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(-45, 50),
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
            const DeckControl(),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

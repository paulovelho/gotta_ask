import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:gotta_ask/pages/deck/card_model.dart';
import 'package:gotta_ask/pages/deck/deck_controls.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/pages/deck/question_card.dart';
import 'package:gotta_ask/state.dart';

class Deck extends StatefulWidget {
  const Deck({
    Key? key,
  }) : super(key: key);

  @override
  State<Deck> createState() => DeckPage();
}

class DeckPage extends State<Deck> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var controller = appState.controller;
    final List<CardModel> cards = appState.deck.getDeck();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: AppinioSwiper(
                backgroundCardsCount: 3,
                swipeOptions: const AppinioSwipeOptions.all(),
                unlimitedUnswipe: true,
                controller: controller,
                onSwiping: (AppinioSwiperDirection direction) {
                  debugPrint(direction.toString());
                },
                onSwipe: _onSwipe,
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 25,
                  top: 50,
                  bottom: 40,
                ),
                cardsSpacing: 20,
                unswipe: _onUndo,
//                onEnd: _onEnd,
                cardsCount: cards.length,
                cardsBuilder: (BuildContext context, int index) {
                  return QuestionCard(question: cards[index]);
                },
              ),
              // child: AppinioSwiper(
              //   controller: controller,
              //   cardsCount: cards.length,
              //   onSwipe: _onSwipe,
              //   onUndo: _onUndo,
              //   numberOfCardsDisplayed: 3,
              //   backCardOffset: const Offset(-45, 50),
              //   padding: const EdgeInsets.all(24.0),
              //   cardBuilder: (
              //     context,
              //     index,
              //     horizontalThresholdPercentage,
              //     verticalThresholdPercentage,
              //   ) =>
              //       cards[index],
              // ),
            ),
            const DeckControl(),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int index,
    AppinioSwiperDirection direction,
  ) {
    debugPrint(
      'The card $index was swiped to the ${direction.name}.',
    );
    return true;
  }

  bool _onUndo(bool unswipe) {
    debugPrint('unswipe: $unswipe');
    return true;
  }
}

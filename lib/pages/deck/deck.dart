import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:gotta_ask/deck_manager.dart';
import 'package:gotta_ask/pages/deck/card_model.dart';
import 'package:gotta_ask/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:gotta_ask/pages/deck/question_card.dart';
import 'package:gotta_ask/state.dart';

class Deck extends StatefulWidget {
  const Deck({
    Key? key,
  }) : super(key: key);

  @override
  State<Deck> createState() => _DeckState();
}

class _DeckState extends State<Deck> {
  @override
  void dispose() {
    super.dispose();
  }

  reload() {
    DeckManager.instance.clearDeck();
    DeckManager.instance.updateDeck();
    setState(() {});
  }

  Widget endOfCards(AppState state) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("endOfDeck".tr()),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: AppTheme.btnStyle(),
              onPressed: () => reload(),
              icon: const Icon(Icons.refresh),
              label: Text("reload".tr()),
            ),
          ],
        ));
  }

  Widget swiperDeck(AppState state, List<CardModel> cards) {
    return Stack(children: [
      endOfCards(state),
      AppinioSwiper(
        backgroundCardsCount: 3,
        swipeOptions: const AppinioSwipeOptions.all(),
        unlimitedUnswipe: true,
        controller: state.controller,
        loop: true,
        onSwiping: (AppinioSwiperDirection direction) {
          debugPrint(direction.toString());
        },
        onSwipe: _onSwipe,
        padding: const EdgeInsets.only(
          left: 50,
          right: 40,
          top: 50,
          bottom: 40,
        ),
        cardsSpacing: 20,
        unswipe: _onUndo,
        isDisabled: state.swipeActive,
        onEnd: _onEnd,
        cardsCount: cards.length,
        cardsBuilder: (BuildContext context, int index) {
          return QuestionCard(question: cards[index]);
        },
      ),
    ]);
  }

  Widget getStream(BuildContext context) {
    var appState = context.watch<AppState>();
    DeckManager.instance.updateDeck();
    return StreamBuilder<List<CardModel>>(
        stream: DeckManager.instance.deckStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CardModel>? cards = snapshot.data;
            cards ??= [];
            debugPrint("stream deck : {$cards}");
            if (cards.isEmpty) {
              return const Text("No Cards found");
            } else {
//              return endOfCards(appState);
              return swiperDeck(appState, cards);
            }
          } else {
            return const Text("loading card");
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return getStream(context);
  }

  bool _onSwipe(int index, AppinioSwiperDirection direction) {
    return DeckManager.instance.canSwipe(index, direction);
  }

  bool _onUndo(bool unswipe) {
    debugPrint('unswipe: $unswipe');
    return true;
  }

  void _onEnd() {
    DeckManager.instance.updateDeck();
    debugPrint("ended");
  }
}

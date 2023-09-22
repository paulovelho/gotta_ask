import 'dart:async';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:gotta_ask/features/packages/control.dart';
import 'package:gotta_ask/features/packages/model.dart';
import 'package:gotta_ask/features/questions/control.dart';
import 'package:gotta_ask/features/questions/model.dart';
import 'package:gotta_ask/pages/deck/card_model.dart';
import 'package:gotta_ask/state.dart';
import 'package:gotta_ask/theme/theme.dart';

class DeckManager {
  DeckManager._privateConstructor() {}
  static final DeckManager instance = DeckManager._privateConstructor();

  final int deckSize = 0;
  List<CardModel> deck = [];
  late String language;

  Future<void> init() async {
    language = await AppState().getSavedLanguage();
    await loadPackagesCache();
  }

  // cached vars:
  List<int> activePackageList_cache = [];
  Future<List<int>> activePackages() async {
    if (activePackageList_cache.isEmpty) {
      activePackageList_cache = await PackageControl().getPackageIdsList();
    }
    return activePackageList_cache;
  }

  clearPackageList() {
    debugPrint("[deck] clear package list]");
    activePackageList_cache = [];
  }

  List<Package> packages_cache = [];
  Future<(String, Color)> packageData(int id) async {
    Package? p = packages_cache.firstWhereOrNull((p) => p.id == id);
    if (p == null) {
      return ("unknown", AppTheme().primary);
    }
    return (p.title, p.getColor());
  }

  Future<void> loadPackagesCache({String? language}) async {
    language ??= await AppState().getSavedLanguage();
    debugPrint("updating cache $language");
    if (packages_cache.isEmpty) {
      packages_cache = await PackageControl().getPackagesList(language);
    }
  }

  Future<CardModel> getCardFromModel(Question q) async {
    var (String name, Color c) = await packageData(q.packageId ?? 0);
    return CardModel(
      id: q.id,
      text: q.getText(),
      package: name,
      favorite: false,
      color: [c],
    );
  }

  Future<List<CardModel>> getCards() async {
    loadPackagesCache();
    List<int> packages = await activePackages();
    debugPrint("[deck] loading cards from packages {$packages}");
    List<Question> cards = await QuestionControl().getCardsFromPackages(
      packages,
      limit: deckSize,
    );
    debugPrint("[deck ]  {$cards} ");
    deck = await Future.wait(
        cards.map((q) async => await getCardFromModel(q)).toList());
    deck.sample(2);
    return deck;
  }

  StreamController<List<CardModel>> deckStream =
      StreamController<List<CardModel>>();

  void clearDeck() {
    deckStream.add([]);
  }

  Future<List<CardModel>> updateDeck() async {
    debugPrint("[deck] updating deck");
    AppState().swipeActive = true;
    await getCards();
    deckStream.add(deck);
    return deck;
  }

  bool canSwipe(int index, AppinioSwiperDirection direction) {
    int totalCards = deck.length;
    debugPrint("swipping ($index){$totalCards}");
    if (index == totalCards - 1) {
      debugPrint("swipe off");
      AppState().swipeActive = false;
    }
    return true;
  }

  Future<int> favorite(CardModel c) async {
    debugPrint("favorite card $c");
    return 0;
  }

  CardModel emptyCard() {
    return CardModel(
        id: -1,
        text: "No More Cards",
        package: "",
        favorite: false,
        color: [Colors.black]);
  }
}

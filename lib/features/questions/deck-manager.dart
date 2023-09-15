import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:gotta_ask/features/packages/model.dart';
import 'package:random_color/random_color.dart';

import 'package:gotta_ask/pages/deck/question-card.dart';
import 'package:gotta_ask/features/questions/model.dart';
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/pages/deck/card-model.dart';

class DeckManager {
  static final DeckManager _instance = DeckManager._internal();
  factory DeckManager() {
    return _instance;
  }
  DeckManager._internal() {}

  DatabaseInstance db() {
    return Database.instance.getDb();
  }

  // cached vars:
  List<int> activePackageList = [];
  Future<List<int>> activePackages() async {
    if (activePackageList.isEmpty) {
      activePackageList = await db().getActivePackageIds();
    }
    return activePackageList;
  }

  clearPackageList() {
    activePackageList = [];
  }

  List<Package> packages = [];
  Future<String> packageName(int id) async {
    if (packages.isEmpty) {
      packages = await db().getPackageList();
    }
    Package? p = packages.firstWhereOrNull((p) => p.id == id);
    return p?.title ?? "unknown";
  }

  Color getRandomColor() =>
      RandomColor().randomColor(colorBrightness: ColorBrightness.dark);

  final Color gradientColor = Colors.black26.withOpacity(1);
  final String package = "basic";

  List<QuestionCard> getDeck() {
    return getQuestions().map(QuestionCard.new).toList();
  }

  Future<CardModel> getCardFromModel(Question q) async {
    String package = await packageName(q.packageId ?? 0);
    return CardModel(
      text: q.getText(),
      package: package,
      favorite: false,
      color: [q.getColor(), gradientColor],
    );
  }

  Future<List<CardModel>> getCards() async {
    List<Question> cards = await db().getSome(await activePackages());
    return await Future.wait(
        cards.map((q) async => await getCardFromModel(q)).toList());
  }

  List<CardModel> getQuestions() {
    getCards();
    return [
      CardModel(
        text: "Se você pudesse ser um legume, qual legume você seria?",
        package: package,
        favorite: false,
        color: [getRandomColor(), gradientColor],
      ),
      CardModel(
        text: "Se você fosse uma batata, como você gostaria de ser comida?",
        package: package,
        favorite: false,
        color: [getRandomColor(), gradientColor],
      ),
      CardModel(
        text: "Você preferia se casar com uma cabra ou com um cisne?",
        package: package,
        favorite: false,
        color: [getRandomColor(), gradientColor],
      ),
    ];
  }

  DatabaseInstance getDb() {
    return db();
  }

  saveQuestion(String text) {
    print("saving $text");
    return getDb().insertQuestion(QuestionRowCompanion(q: dr.Value(text)));
  }

  Future<List<Question>> getSavedQuestions() async {
    return await db().getQuestionList();
  }
}

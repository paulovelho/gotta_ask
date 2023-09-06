import 'package:flutter/cupertino.dart';

class CardModel {
  String name;
  String job;
  String city;
  List<Color> color;

  CardModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
  });
}

class QuestionModel {
  String text;
  String package;
  bool favorite;
  List<Color> color;

  QuestionModel({
    required this.text,
    required this.package,
    required this.favorite,
    required this.color,
  });
}

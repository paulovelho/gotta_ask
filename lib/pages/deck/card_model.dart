import 'package:flutter/cupertino.dart';

class CardModel {
  String text;
  String package;
  bool favorite;
  List<Color> color;

  CardModel({
    required this.text,
    required this.package,
    required this.favorite,
    required this.color,
  });
}

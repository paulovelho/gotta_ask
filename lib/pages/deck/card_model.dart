import 'package:flutter/cupertino.dart';

class CardModel {
  int id;
  String text;
  String package;
  bool favorite;
  List<Color> color;

  CardModel({
    required this.id,
    required this.text,
    required this.package,
    required this.favorite,
    required this.color,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "[CARD {$id-$text} ($package)]";
  }
}

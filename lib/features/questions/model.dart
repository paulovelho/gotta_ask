import 'package:flutter/material.dart';

class Question {
  final int id;
  final String q;
  final int? packageId;
  Question({
    required this.id,
    required this.q,
    this.packageId,
  });

  String getText() {
    return q;
  }

  Color getColor() {
    return Colors.red;
  }
}

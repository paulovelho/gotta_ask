import 'package:flutter/material.dart';
import 'package:gotta_ask/helpers.dart';

class Package {
  final int id;
  final String name;
  final String title;
  final String language;
  final String? color;
  final double version;
  final bool active;
  final bool listed;

  const Package({
    required this.id,
    required this.name,
    required this.title,
    required this.language,
    this.color,
    required this.version,
    required this.active,
    required this.listed,
  });

  String getRGB() {
    return color ?? "#000";
  }

  Color getColor() {
    return Helper.colorFromHex(getRGB());
  }
}

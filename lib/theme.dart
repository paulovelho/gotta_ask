import 'package:flutter/material.dart';

ThemeData platypusTheme() {
  final ThemeData base = ThemeData.dark();
  Color primary = Colors.green;
  ColorScheme baseColor = ColorScheme.fromSeed(seedColor: primary);
  return base.copyWith(
    colorScheme: baseColor,
    primaryColor: primary,
  );
}

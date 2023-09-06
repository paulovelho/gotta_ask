import 'package:flutter/material.dart';

ThemeData platypusTheme() {
  final ThemeData base = ThemeData.light();
  ColorScheme baseColor = ColorScheme.fromSeed(seedColor: Colors.green);
  return base.copyWith(
    colorScheme: baseColor,
  );
}

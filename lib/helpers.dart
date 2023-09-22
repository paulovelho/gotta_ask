import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class Helper {
  static Color createRandomColor() => RandomColor()
      .randomColor(colorBrightness: ColorBrightness.dark)
      .withOpacity(1);
  static Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

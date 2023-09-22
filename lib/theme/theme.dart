import 'package:flutter/material.dart';

class AppTheme {
  final Color primary = Colors.green;
  bool useDark = true;

  static ColorScheme getScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static ButtonStyle btnStyle() {
    return ElevatedButton.styleFrom(
      elevation: 3,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    );
  }

  PlatypusExtension getExtension() {
    return PlatypusExtension(
      cardGradient: Colors.black26.withOpacity(1),
    );
  }

  ThemeData getTheme() {
    ThemeData base = useDark ? ThemeData.dark() : ThemeData.light();
    return base.copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      primaryColor: primary,
      extensions: [getExtension()],
    );
  }
}

class PlatypusExtension extends ThemeExtension<PlatypusExtension> {
  final Color cardGradient;
  PlatypusExtension({
    required this.cardGradient,
  });

  @override
  ThemeExtension<PlatypusExtension> copyWith({
    Color? cardGradient,
  }) {
    return PlatypusExtension(cardGradient: cardGradient ?? this.cardGradient);
  }

  // lerp() is used to linearly interpolate with another ThemeExtension object, and make an animation when changing the theme.
  @override
  ThemeExtension<PlatypusExtension> lerp(
    covariant ThemeExtension<PlatypusExtension>? other,
    double t,
  ) {
    if (other is! PlatypusExtension) {
      return this;
    }
    return PlatypusExtension(
      cardGradient: Color.lerp(cardGradient, other.cardGradient, t)!,
    );
  }
}

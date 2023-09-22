import 'package:flutter/material.dart';

class FormTheme {
  static BoxDecoration formBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.outline,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow,
          blurRadius: 2.0,
          offset: const Offset(2.0, 2.0),
        ),
      ],
    );
  }
}

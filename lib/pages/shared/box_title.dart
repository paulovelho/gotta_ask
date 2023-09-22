import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BoxTitle extends StatelessWidget {
  final String title;

  const BoxTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  Widget getTitle(context) {
    return AutoSizeText(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: 25,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: getTitle(context),
    );
  }
}

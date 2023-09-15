import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:gotta_ask/theme.dart';

class BoxTitle extends StatelessWidget {
  final String title;

  const BoxTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      color: platypusTheme().primaryColor,
      child: Text(
        context.tr(title),
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 20,
          color: platypusTheme().primaryColor,
        ),
      ),
    );
  }
}

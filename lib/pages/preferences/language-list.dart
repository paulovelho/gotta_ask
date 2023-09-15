import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gotta_ask/main.dart';
import 'package:gotta_ask/pages/shared/box-title.dart';
import 'package:gotta_ask/state.dart';
import 'package:provider/provider.dart';

class LanguageFlipper extends StatefulWidget {
  const LanguageFlipper({Key? key}) : super(key: key);
  @override
  State<LanguageFlipper> createState() => _LanguageFlipper();
}

class _LanguageFlipper extends State<LanguageFlipper> {
  late AppState state;
  String? _activeLanguage;

  Widget getLanguageRadio(BuildContext context, String val, String name) {
    return RadioListTile(
      value: val,
      title: Text(name),
      groupValue: _activeLanguage,
      onChanged: (String? value) {
        setState(() {
          print("setting locale $value");
          context.setLocale(Locale(value ?? "en"));
          state.setLanguage(value ?? "");
          _activeLanguage = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    state = context.watch<AppState>();
    _activeLanguage = state.activeLanguage;
    return Column(
      children: <Widget>[
        const BoxTitle("languages"),
        getLanguageRadio(context, "pt", "langPt".tr()),
        getLanguageRadio(context, "en", "langEn".tr()),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gotta_ask/deck_manager.dart';
import 'package:gotta_ask/pages/shared/box_title.dart';
import 'package:gotta_ask/state.dart';
import 'package:gotta_ask/theme/form_decoration.dart';
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
          context.setLocale(Locale(value ?? "en"));
          state.setLanguage(value ?? "");
          _activeLanguage = value;
          DeckManager.instance.clearPackageList();
          DeckManager.instance.updateDeck();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    state = context.watch<AppState>();
    _activeLanguage = state.activeLanguage;
    return Column(
      children: [
        BoxTitle(context.tr("languages")),
        const SizedBox(height: 10),
        Container(
          decoration: FormTheme.formBoxDecoration(context),
          child: Column(
            children: <Widget>[
              getLanguageRadio(context, "pt", "langPt".tr()),
              getLanguageRadio(context, "en", "langEn".tr()),
            ],
          ),
        )
      ],
    );
  }
}

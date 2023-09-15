import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gotta_ask/features/questions/deck-manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  var controller = CardSwiperController();
  DeckManager deck = DeckManager();
  String defaultLanguage = "en";
  String activeLanguage = "";

  AppState() {
    start();
  }

  Future<void> start() async {
    activeLanguage = await getSavedLanguage();
  }

  Future<SharedPreferences> prefs() {
    return SharedPreferences.getInstance();
  }

  Future<String> getSavedLanguage() async {
    SharedPreferences p = await prefs();
    return p.getString("language") ?? defaultLanguage;
  }

  Future<bool> setLanguage(String lang) async {
    SharedPreferences p = await prefs();
    activeLanguage = lang;
    return p.setString("language", lang);
  }
}

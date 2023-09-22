import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gotta_ask/deck_manager.dart';
import 'package:gotta_ask/pages/deck/card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  var controller = AppinioSwiperController();
  String defaultLanguage = "en";
  String activeLanguage = "";
  List<CardModel> cards = [];
  bool swipeActive = true;

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
    DeckManager.instance.loadPackagesCache(language: lang);
    reload();
    return p.setString("language", lang);
  }

  void reload() {
    notifyListeners();
  }
}

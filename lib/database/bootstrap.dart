import 'package:flutter/material.dart';
import 'package:gotta_ask/features/packages/crawler.dart';
import 'package:gotta_ask/state.dart';

class Bootstrap {
  Future<void> load() async {
    return;
  }

  Future<void> install({String? language}) async {
    language ??= AppState().defaultLanguage;
    await PackageCrawler().installLanguage(language);
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gotta_ask/features/packages/control.dart';
import 'package:gotta_ask/features/questions/control.dart';

class PackageCrawler {
  List<String> ptPackages = [
    "authors",
    "openers",
    "pop",
    "questions",
    "sex",
    "viagem",
    "wouldyou",
  ];
  List<String> enPackages = [
    "paulovelho",
    "wouldyou",
  ];

  Future<Map<String, dynamic>> parseJson(String jsonPath) async {
    print("---parsing $jsonPath");
    return rootBundle.loadString(jsonPath).then((value) => jsonDecode(value));
  }

  Future<void> loadPackage(String lang, String file) async {
    String path = 'assets/data/$lang/$file.json';
    var data = await parseJson(path);
    bool active = (data["active"] == 1);
    bool listed = (data["listed"] == 1);
    int packId = await PackageControl().installPackage(
      data["name"],
      data["language"],
      data["title"],
      data["color"],
      data["version"],
      active,
      listed,
    );
    return await installQuestions(packId, data["data"]);
  }

  Future<void> installQuestions(int packageId, List<dynamic> questions) async {
    for (var q in questions) {
      await QuestionControl().addQuestion(q, packageId);
    }
  }

  installLanguage(String lang) async {
    List<String> packages = [];
    if (lang == "pt") packages = ptPackages;
    if (lang == "en") packages = enPackages;
    for (String pack in packages) {
      loadPackage(lang, pack);
    }
  }
}

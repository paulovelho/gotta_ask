import 'package:drift/drift.dart' as dr;
import 'package:flutter/material.dart';
import 'package:gotta_ask/features/packages/model.dart';
import 'package:random_color/random_color.dart';

import 'package:gotta_ask/database/database.dart';

class PackageControl {
  Color createRandomColor() => RandomColor()
      .randomColor(colorBrightness: ColorBrightness.dark)
      .withOpacity(1);

  String getUniqueName(String name, String lang) {
    return "$lang-$name";
  }

  DatabaseInstance db() {
    return Database.instance.getDb();
  }

  Future<List<int>> getPackageList() {
    return db().getActivePackageIds();
  }

  Future<bool> isPackageInstalled(
    String name,
    double version,
  ) async {
    return db().checkPackageExists(name, version);
  }

  Future<int> togglePackage(Package p) {
    return db().togglePackageActive(p.id, !p.active);
  }

  Future<int> installPackage(
    String name,
    String lang,
    String title,
    String? color,
    double version,
    bool active,
    bool listed,
  ) async {
    color = color ?? "#${createRandomColor().value.toRadixString(16)}";
    String uniqueName = getUniqueName(name, lang);
    bool isInstalled = await isPackageInstalled(uniqueName, version);
    if (isInstalled) return 0;
    print("installing $name");
    PackageRowCompanion p = PackageRowCompanion(
      name: dr.Value(uniqueName),
      title: dr.Value(title),
      language: dr.Value(lang),
      color: dr.Value(color),
      version: dr.Value(version),
      active: dr.Value(active),
      listed: dr.Value(listed),
    );
    return db().insertPackage(p);
  }
}

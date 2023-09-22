import 'package:drift/drift.dart' as dr;
import 'package:gotta_ask/features/packages/model.dart';
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/helpers.dart';
import 'package:gotta_ask/state.dart';

class PackageControl {
  String getUniqueName(String name, String lang) {
    return "$lang-$name";
  }

  DatabaseInstance db() {
    return Database.instance.getDb();
  }

  Future<List<int>> getPackageIdsList({String? language}) async {
    language ??= await AppState().getSavedLanguage();
    return db().getActivePackageIds(language);
  }

  Future<List<Package>> getPackagesList(String language) {
    return db().getPackageList(language);
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
    color = color ?? "#${Helper.createRandomColor().value.toRadixString(16)}";
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

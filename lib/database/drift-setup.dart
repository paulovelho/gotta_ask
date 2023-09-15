import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// generate with `dart run build_runner build`
// keep dev with `dart run build_runner watch`
class DriftSetupDb {
  int get schemaVersion => 1;

  Future<File> getDbFile() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    const String fileName = "db.sqlite";
    return File(p.join(dbFolder.path, fileName));
  }

  LazyDatabase connect() {
    return LazyDatabase(() async {
      return NativeDatabase(await getDbFile());
    });
  }
}

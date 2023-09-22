import 'package:drift/drift.dart';
import 'package:gotta_ask/database/drift-setup.dart';
import 'package:gotta_ask/features/questions/model.dart';
import 'package:gotta_ask/features/packages/model.dart';

part 'database.g.dart';

@UseRowClass(Question)
class QuestionRow extends Table {
  @override
  String get tableName => 'questions';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get q => text()();
  IntColumn? get packageId => integer().nullable()();
}

@UseRowClass(Package)
class PackageRow extends Table {
  @override
  String get tableName => 'packages';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get title => text()();
  TextColumn get language => text()();
  TextColumn get color => text().nullable()();
  RealColumn get version => real()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  BoolColumn get listed => boolean().withDefault(const Constant(true))();
}

@DriftDatabase(tables: [QuestionRow, PackageRow])
class DatabaseInstance extends _$DatabaseInstance {
  DatabaseInstance() : super(DriftSetupDb().connect());

  @override
  int get schemaVersion => DriftSetupDb().schemaVersion;

  Future<List<Question>> getQuestionList() async {
    return await select(questionRow).get();
  }

  Future<int> insertQuestion(QuestionRowCompanion q) async {
    return await into(questionRow).insert(q);
  }

  Future<List<Question>> getSomeQuestions(List<int> packages,
      {int limit = 20}) async {
    var query = select(questionRow)
      ..where((q) => q.packageId.isIn(packages))
      ..orderBy([(q) => OrderingTerm.random()]);
    if (limit > 0) {
      query = query..limit(limit);
    }
    return query.get();
  }

  Future<List<Package>> getPackageList(String lang) async {
    return await (select(packageRow)
          ..where((q) => q.language.equals(lang))
          ..orderBy([(p) => OrderingTerm(expression: p.name)]))
        .get();
  }

  Future<List<int>> getActivePackageIds(String language) {
    final query = select(packageRow, distinct: true)
      ..addColumns([packageRow.id])
      ..where((p) => p.active.equals(true) & p.language.equals(language));
    return query.map((p) => p.id).get();
  }

  Future<int> insertPackage(PackageRowCompanion p) async {
    return await into(packageRow).insert(p);
  }

  Future<int> togglePackageActive(int id, bool active) {
    return (update(packageRow)..where((p) => p.id.equals(id)))
        .write(PackageRowCompanion(active: Value(active)));
  }

  Future<bool> checkPackageExists(String name, double version) async {
    int qtt = await customSelect(
      'SELECT COUNT(1) AS ok FROM packages WHERE name = ? AND version = ?',
      variables: [Variable.withString(name), Variable.withReal(version)],
    ).watch().map((rs) {
      QueryRow q = rs.first;
      return q.read<int>('ok');
    }).firstWhere((element) => true);
    return qtt == 1;
  }
}

class Database {
  DatabaseInstance db = DatabaseInstance();
  Database._privateConstructor() {}

  static final Database instance = Database._privateConstructor();

  DatabaseInstance getDb() {
    return db;
  }
}

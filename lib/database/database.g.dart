// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $QuestionRowTable extends QuestionRow
    with TableInfo<$QuestionRowTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _qMeta = const VerificationMeta('q');
  @override
  late final GeneratedColumn<String> q = GeneratedColumn<String>(
      'q', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _packageIdMeta =
      const VerificationMeta('packageId');
  @override
  late final GeneratedColumn<int> packageId = GeneratedColumn<int>(
      'package_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, q, packageId];
  @override
  String get aliasedName => _alias ?? 'questions';
  @override
  String get actualTableName => 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('q')) {
      context.handle(_qMeta, q.isAcceptableOrUnknown(data['q']!, _qMeta));
    } else if (isInserting) {
      context.missing(_qMeta);
    }
    if (data.containsKey('package_id')) {
      context.handle(_packageIdMeta,
          packageId.isAcceptableOrUnknown(data['package_id']!, _packageIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      q: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}q'])!,
      packageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}package_id']),
    );
  }

  @override
  $QuestionRowTable createAlias(String alias) {
    return $QuestionRowTable(attachedDatabase, alias);
  }
}

class QuestionRowCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<String> q;
  final Value<int?> packageId;
  const QuestionRowCompanion({
    this.id = const Value.absent(),
    this.q = const Value.absent(),
    this.packageId = const Value.absent(),
  });
  QuestionRowCompanion.insert({
    this.id = const Value.absent(),
    required String q,
    this.packageId = const Value.absent(),
  }) : q = Value(q);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<String>? q,
    Expression<int>? packageId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (q != null) 'q': q,
      if (packageId != null) 'package_id': packageId,
    });
  }

  QuestionRowCompanion copyWith(
      {Value<int>? id, Value<String>? q, Value<int?>? packageId}) {
    return QuestionRowCompanion(
      id: id ?? this.id,
      q: q ?? this.q,
      packageId: packageId ?? this.packageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (q.present) {
      map['q'] = Variable<String>(q.value);
    }
    if (packageId.present) {
      map['package_id'] = Variable<int>(packageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionRowCompanion(')
          ..write('id: $id, ')
          ..write('q: $q, ')
          ..write('packageId: $packageId')
          ..write(')'))
        .toString();
  }
}

class $PackageRowTable extends PackageRow
    with TableInfo<$PackageRowTable, Package> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PackageRowTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<double> version = GeneratedColumn<double>(
      'version', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _listedMeta = const VerificationMeta('listed');
  @override
  late final GeneratedColumn<bool> listed = GeneratedColumn<bool>(
      'listed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("listed" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, title, language, color, version, active, listed];
  @override
  String get aliasedName => _alias ?? 'packages';
  @override
  String get actualTableName => 'packages';
  @override
  VerificationContext validateIntegrity(Insertable<Package> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('listed')) {
      context.handle(_listedMeta,
          listed.isAcceptableOrUnknown(data['listed']!, _listedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Package map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Package(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}version'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      listed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}listed'])!,
    );
  }

  @override
  $PackageRowTable createAlias(String alias) {
    return $PackageRowTable(attachedDatabase, alias);
  }
}

class PackageRowCompanion extends UpdateCompanion<Package> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> title;
  final Value<String> language;
  final Value<String?> color;
  final Value<double> version;
  final Value<bool> active;
  final Value<bool> listed;
  const PackageRowCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.title = const Value.absent(),
    this.language = const Value.absent(),
    this.color = const Value.absent(),
    this.version = const Value.absent(),
    this.active = const Value.absent(),
    this.listed = const Value.absent(),
  });
  PackageRowCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String title,
    required String language,
    this.color = const Value.absent(),
    required double version,
    this.active = const Value.absent(),
    this.listed = const Value.absent(),
  })  : name = Value(name),
        title = Value(title),
        language = Value(language),
        version = Value(version);
  static Insertable<Package> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? title,
    Expression<String>? language,
    Expression<String>? color,
    Expression<double>? version,
    Expression<bool>? active,
    Expression<bool>? listed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (title != null) 'title': title,
      if (language != null) 'language': language,
      if (color != null) 'color': color,
      if (version != null) 'version': version,
      if (active != null) 'active': active,
      if (listed != null) 'listed': listed,
    });
  }

  PackageRowCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? title,
      Value<String>? language,
      Value<String?>? color,
      Value<double>? version,
      Value<bool>? active,
      Value<bool>? listed}) {
    return PackageRowCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      language: language ?? this.language,
      color: color ?? this.color,
      version: version ?? this.version,
      active: active ?? this.active,
      listed: listed ?? this.listed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (version.present) {
      map['version'] = Variable<double>(version.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (listed.present) {
      map['listed'] = Variable<bool>(listed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PackageRowCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('title: $title, ')
          ..write('language: $language, ')
          ..write('color: $color, ')
          ..write('version: $version, ')
          ..write('active: $active, ')
          ..write('listed: $listed')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseInstance extends GeneratedDatabase {
  _$DatabaseInstance(QueryExecutor e) : super(e);
  late final $QuestionRowTable questionRow = $QuestionRowTable(this);
  late final $PackageRowTable packageRow = $PackageRowTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questionRow, packageRow];
}

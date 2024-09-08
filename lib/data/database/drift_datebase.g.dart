// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_datebase.dart';

// ignore_for_file: type=lint
class $BankOperationDriftModelTable extends BankOperationDriftModel
    with TableInfo<$BankOperationDriftModelTable, BankOperationDriftModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankOperationDriftModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeOperationMeta =
      const VerificationMeta('typeOperation');
  @override
  late final GeneratedColumn<String> typeOperation = GeneratedColumn<String>(
      'type_operation', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _purposeMeta =
      const VerificationMeta('purpose');
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
      'purpose', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summMeta = const VerificationMeta('summ');
  @override
  late final GeneratedColumn<double> summ = GeneratedColumn<double>(
      'summ', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isExpenditureMeta =
      const VerificationMeta('isExpenditure');
  @override
  late final GeneratedColumn<bool> isExpenditure = GeneratedColumn<bool>(
      'is_expenditure', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_expenditure" IN (0, 1))'));
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        typeOperation,
        purpose,
        date,
        updatedAt,
        summ,
        isExpenditure,
        categoryName
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_operation_drift_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<BankOperationDriftModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type_operation')) {
      context.handle(
          _typeOperationMeta,
          typeOperation.isAcceptableOrUnknown(
              data['type_operation']!, _typeOperationMeta));
    } else if (isInserting) {
      context.missing(_typeOperationMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('summ')) {
      context.handle(
          _summMeta, summ.isAcceptableOrUnknown(data['summ']!, _summMeta));
    } else if (isInserting) {
      context.missing(_summMeta);
    }
    if (data.containsKey('is_expenditure')) {
      context.handle(
          _isExpenditureMeta,
          isExpenditure.isAcceptableOrUnknown(
              data['is_expenditure']!, _isExpenditureMeta));
    } else if (isInserting) {
      context.missing(_isExpenditureMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankOperationDriftModelData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankOperationDriftModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      typeOperation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_operation'])!,
      purpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purpose'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      summ: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}summ'])!,
      isExpenditure: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expenditure'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
    );
  }

  @override
  $BankOperationDriftModelTable createAlias(String alias) {
    return $BankOperationDriftModelTable(attachedDatabase, alias);
  }
}

class BankOperationDriftModelData extends DataClass
    implements Insertable<BankOperationDriftModelData> {
  final int id;
  final String typeOperation;
  final String purpose;
  final String date;
  final String updatedAt;
  final double summ;
  final bool isExpenditure;
  final String? categoryName;
  const BankOperationDriftModelData(
      {required this.id,
      required this.typeOperation,
      required this.purpose,
      required this.date,
      required this.updatedAt,
      required this.summ,
      required this.isExpenditure,
      this.categoryName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_operation'] = Variable<String>(typeOperation);
    map['purpose'] = Variable<String>(purpose);
    map['date'] = Variable<String>(date);
    map['updated_at'] = Variable<String>(updatedAt);
    map['summ'] = Variable<double>(summ);
    map['is_expenditure'] = Variable<bool>(isExpenditure);
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    return map;
  }

  BankOperationDriftModelCompanion toCompanion(bool nullToAbsent) {
    return BankOperationDriftModelCompanion(
      id: Value(id),
      typeOperation: Value(typeOperation),
      purpose: Value(purpose),
      date: Value(date),
      updatedAt: Value(updatedAt),
      summ: Value(summ),
      isExpenditure: Value(isExpenditure),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
    );
  }

  factory BankOperationDriftModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankOperationDriftModelData(
      id: serializer.fromJson<int>(json['id']),
      typeOperation: serializer.fromJson<String>(json['typeOperation']),
      purpose: serializer.fromJson<String>(json['purpose']),
      date: serializer.fromJson<String>(json['date']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      summ: serializer.fromJson<double>(json['summ']),
      isExpenditure: serializer.fromJson<bool>(json['isExpenditure']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeOperation': serializer.toJson<String>(typeOperation),
      'purpose': serializer.toJson<String>(purpose),
      'date': serializer.toJson<String>(date),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'summ': serializer.toJson<double>(summ),
      'isExpenditure': serializer.toJson<bool>(isExpenditure),
      'categoryName': serializer.toJson<String?>(categoryName),
    };
  }

  BankOperationDriftModelData copyWith(
          {int? id,
          String? typeOperation,
          String? purpose,
          String? date,
          String? updatedAt,
          double? summ,
          bool? isExpenditure,
          Value<String?> categoryName = const Value.absent()}) =>
      BankOperationDriftModelData(
        id: id ?? this.id,
        typeOperation: typeOperation ?? this.typeOperation,
        purpose: purpose ?? this.purpose,
        date: date ?? this.date,
        updatedAt: updatedAt ?? this.updatedAt,
        summ: summ ?? this.summ,
        isExpenditure: isExpenditure ?? this.isExpenditure,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
      );
  BankOperationDriftModelData copyWithCompanion(
      BankOperationDriftModelCompanion data) {
    return BankOperationDriftModelData(
      id: data.id.present ? data.id.value : this.id,
      typeOperation: data.typeOperation.present
          ? data.typeOperation.value
          : this.typeOperation,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      date: data.date.present ? data.date.value : this.date,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      summ: data.summ.present ? data.summ.value : this.summ,
      isExpenditure: data.isExpenditure.present
          ? data.isExpenditure.value
          : this.isExpenditure,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationDriftModelData(')
          ..write('id: $id, ')
          ..write('typeOperation: $typeOperation, ')
          ..write('purpose: $purpose, ')
          ..write('date: $date, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summ: $summ, ')
          ..write('isExpenditure: $isExpenditure, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeOperation, purpose, date, updatedAt,
      summ, isExpenditure, categoryName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankOperationDriftModelData &&
          other.id == this.id &&
          other.typeOperation == this.typeOperation &&
          other.purpose == this.purpose &&
          other.date == this.date &&
          other.updatedAt == this.updatedAt &&
          other.summ == this.summ &&
          other.isExpenditure == this.isExpenditure &&
          other.categoryName == this.categoryName);
}

class BankOperationDriftModelCompanion
    extends UpdateCompanion<BankOperationDriftModelData> {
  final Value<int> id;
  final Value<String> typeOperation;
  final Value<String> purpose;
  final Value<String> date;
  final Value<String> updatedAt;
  final Value<double> summ;
  final Value<bool> isExpenditure;
  final Value<String?> categoryName;
  const BankOperationDriftModelCompanion({
    this.id = const Value.absent(),
    this.typeOperation = const Value.absent(),
    this.purpose = const Value.absent(),
    this.date = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.summ = const Value.absent(),
    this.isExpenditure = const Value.absent(),
    this.categoryName = const Value.absent(),
  });
  BankOperationDriftModelCompanion.insert({
    this.id = const Value.absent(),
    required String typeOperation,
    required String purpose,
    required String date,
    required String updatedAt,
    required double summ,
    required bool isExpenditure,
    this.categoryName = const Value.absent(),
  })  : typeOperation = Value(typeOperation),
        purpose = Value(purpose),
        date = Value(date),
        updatedAt = Value(updatedAt),
        summ = Value(summ),
        isExpenditure = Value(isExpenditure);
  static Insertable<BankOperationDriftModelData> custom({
    Expression<int>? id,
    Expression<String>? typeOperation,
    Expression<String>? purpose,
    Expression<String>? date,
    Expression<String>? updatedAt,
    Expression<double>? summ,
    Expression<bool>? isExpenditure,
    Expression<String>? categoryName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeOperation != null) 'type_operation': typeOperation,
      if (purpose != null) 'purpose': purpose,
      if (date != null) 'date': date,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (summ != null) 'summ': summ,
      if (isExpenditure != null) 'is_expenditure': isExpenditure,
      if (categoryName != null) 'category_name': categoryName,
    });
  }

  BankOperationDriftModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? typeOperation,
      Value<String>? purpose,
      Value<String>? date,
      Value<String>? updatedAt,
      Value<double>? summ,
      Value<bool>? isExpenditure,
      Value<String?>? categoryName}) {
    return BankOperationDriftModelCompanion(
      id: id ?? this.id,
      typeOperation: typeOperation ?? this.typeOperation,
      purpose: purpose ?? this.purpose,
      date: date ?? this.date,
      updatedAt: updatedAt ?? this.updatedAt,
      summ: summ ?? this.summ,
      isExpenditure: isExpenditure ?? this.isExpenditure,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (typeOperation.present) {
      map['type_operation'] = Variable<String>(typeOperation.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (summ.present) {
      map['summ'] = Variable<double>(summ.value);
    }
    if (isExpenditure.present) {
      map['is_expenditure'] = Variable<bool>(isExpenditure.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationDriftModelCompanion(')
          ..write('id: $id, ')
          ..write('typeOperation: $typeOperation, ')
          ..write('purpose: $purpose, ')
          ..write('date: $date, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summ: $summ, ')
          ..write('isExpenditure: $isExpenditure, ')
          ..write('categoryName: $categoryName')
          ..write(')'))
        .toString();
  }
}

class $BankOperationCategoryModelDriftModelTable
    extends BankOperationCategoryModelDriftModel
    with
        TableInfo<$BankOperationCategoryModelDriftModelTable,
            BankOperationCategoryModelDriftModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankOperationCategoryModelDriftModelTable(this.attachedDatabase,
      [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summMeta = const VerificationMeta('summ');
  @override
  late final GeneratedColumn<double> summ = GeneratedColumn<double>(
      'summ', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, summ, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_operation_category_model_drift_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<BankOperationCategoryModelDriftModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summ')) {
      context.handle(
          _summMeta, summ.isAcceptableOrUnknown(data['summ']!, _summMeta));
    } else if (isInserting) {
      context.missing(_summMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BankOperationCategoryModelDriftModelData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankOperationCategoryModelDriftModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      summ: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}summ'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $BankOperationCategoryModelDriftModelTable createAlias(String alias) {
    return $BankOperationCategoryModelDriftModelTable(attachedDatabase, alias);
  }
}

class BankOperationCategoryModelDriftModelData extends DataClass
    implements Insertable<BankOperationCategoryModelDriftModelData> {
  final int id;
  final String title;
  final double summ;
  final DateTime date;
  const BankOperationCategoryModelDriftModelData(
      {required this.id,
      required this.title,
      required this.summ,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['summ'] = Variable<double>(summ);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  BankOperationCategoryModelDriftModelCompanion toCompanion(bool nullToAbsent) {
    return BankOperationCategoryModelDriftModelCompanion(
      id: Value(id),
      title: Value(title),
      summ: Value(summ),
      date: Value(date),
    );
  }

  factory BankOperationCategoryModelDriftModelData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankOperationCategoryModelDriftModelData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      summ: serializer.fromJson<double>(json['summ']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'summ': serializer.toJson<double>(summ),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  BankOperationCategoryModelDriftModelData copyWith(
          {int? id, String? title, double? summ, DateTime? date}) =>
      BankOperationCategoryModelDriftModelData(
        id: id ?? this.id,
        title: title ?? this.title,
        summ: summ ?? this.summ,
        date: date ?? this.date,
      );
  BankOperationCategoryModelDriftModelData copyWithCompanion(
      BankOperationCategoryModelDriftModelCompanion data) {
    return BankOperationCategoryModelDriftModelData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      summ: data.summ.present ? data.summ.value : this.summ,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationCategoryModelDriftModelData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summ: $summ, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, summ, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankOperationCategoryModelDriftModelData &&
          other.id == this.id &&
          other.title == this.title &&
          other.summ == this.summ &&
          other.date == this.date);
}

class BankOperationCategoryModelDriftModelCompanion
    extends UpdateCompanion<BankOperationCategoryModelDriftModelData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> summ;
  final Value<DateTime> date;
  const BankOperationCategoryModelDriftModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.summ = const Value.absent(),
    this.date = const Value.absent(),
  });
  BankOperationCategoryModelDriftModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double summ,
    required DateTime date,
  })  : title = Value(title),
        summ = Value(summ),
        date = Value(date);
  static Insertable<BankOperationCategoryModelDriftModelData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? summ,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (summ != null) 'summ': summ,
      if (date != null) 'date': date,
    });
  }

  BankOperationCategoryModelDriftModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? summ,
      Value<DateTime>? date}) {
    return BankOperationCategoryModelDriftModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      summ: summ ?? this.summ,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summ.present) {
      map['summ'] = Variable<double>(summ.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationCategoryModelDriftModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summ: $summ, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BankOperationDriftModelTable bankOperationDriftModel =
      $BankOperationDriftModelTable(this);
  late final $BankOperationCategoryModelDriftModelTable
      bankOperationCategoryModelDriftModel =
      $BankOperationCategoryModelDriftModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bankOperationDriftModel, bankOperationCategoryModelDriftModel];
}

typedef $$BankOperationDriftModelTableCreateCompanionBuilder
    = BankOperationDriftModelCompanion Function({
  Value<int> id,
  required String typeOperation,
  required String purpose,
  required String date,
  required String updatedAt,
  required double summ,
  required bool isExpenditure,
  Value<String?> categoryName,
});
typedef $$BankOperationDriftModelTableUpdateCompanionBuilder
    = BankOperationDriftModelCompanion Function({
  Value<int> id,
  Value<String> typeOperation,
  Value<String> purpose,
  Value<String> date,
  Value<String> updatedAt,
  Value<double> summ,
  Value<bool> isExpenditure,
  Value<String?> categoryName,
});

class $$BankOperationDriftModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BankOperationDriftModelTable> {
  $$BankOperationDriftModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get typeOperation => $state.composableBuilder(
      column: $state.table.typeOperation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get purpose => $state.composableBuilder(
      column: $state.table.purpose,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get summ => $state.composableBuilder(
      column: $state.table.summ,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isExpenditure => $state.composableBuilder(
      column: $state.table.isExpenditure,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BankOperationDriftModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BankOperationDriftModelTable> {
  $$BankOperationDriftModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get typeOperation => $state.composableBuilder(
      column: $state.table.typeOperation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get purpose => $state.composableBuilder(
      column: $state.table.purpose,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get summ => $state.composableBuilder(
      column: $state.table.summ,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isExpenditure => $state.composableBuilder(
      column: $state.table.isExpenditure,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BankOperationDriftModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankOperationDriftModelTable,
    BankOperationDriftModelData,
    $$BankOperationDriftModelTableFilterComposer,
    $$BankOperationDriftModelTableOrderingComposer,
    $$BankOperationDriftModelTableCreateCompanionBuilder,
    $$BankOperationDriftModelTableUpdateCompanionBuilder,
    (
      BankOperationDriftModelData,
      BaseReferences<_$AppDatabase, $BankOperationDriftModelTable,
          BankOperationDriftModelData>
    ),
    BankOperationDriftModelData,
    PrefetchHooks Function()> {
  $$BankOperationDriftModelTableTableManager(
      _$AppDatabase db, $BankOperationDriftModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$BankOperationDriftModelTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BankOperationDriftModelTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> typeOperation = const Value.absent(),
            Value<String> purpose = const Value.absent(),
            Value<String> date = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<double> summ = const Value.absent(),
            Value<bool> isExpenditure = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
          }) =>
              BankOperationDriftModelCompanion(
            id: id,
            typeOperation: typeOperation,
            purpose: purpose,
            date: date,
            updatedAt: updatedAt,
            summ: summ,
            isExpenditure: isExpenditure,
            categoryName: categoryName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String typeOperation,
            required String purpose,
            required String date,
            required String updatedAt,
            required double summ,
            required bool isExpenditure,
            Value<String?> categoryName = const Value.absent(),
          }) =>
              BankOperationDriftModelCompanion.insert(
            id: id,
            typeOperation: typeOperation,
            purpose: purpose,
            date: date,
            updatedAt: updatedAt,
            summ: summ,
            isExpenditure: isExpenditure,
            categoryName: categoryName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BankOperationDriftModelTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BankOperationDriftModelTable,
        BankOperationDriftModelData,
        $$BankOperationDriftModelTableFilterComposer,
        $$BankOperationDriftModelTableOrderingComposer,
        $$BankOperationDriftModelTableCreateCompanionBuilder,
        $$BankOperationDriftModelTableUpdateCompanionBuilder,
        (
          BankOperationDriftModelData,
          BaseReferences<_$AppDatabase, $BankOperationDriftModelTable,
              BankOperationDriftModelData>
        ),
        BankOperationDriftModelData,
        PrefetchHooks Function()>;
typedef $$BankOperationCategoryModelDriftModelTableCreateCompanionBuilder
    = BankOperationCategoryModelDriftModelCompanion Function({
  Value<int> id,
  required String title,
  required double summ,
  required DateTime date,
});
typedef $$BankOperationCategoryModelDriftModelTableUpdateCompanionBuilder
    = BankOperationCategoryModelDriftModelCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<double> summ,
  Value<DateTime> date,
});

class $$BankOperationCategoryModelDriftModelTableFilterComposer
    extends FilterComposer<_$AppDatabase,
        $BankOperationCategoryModelDriftModelTable> {
  $$BankOperationCategoryModelDriftModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get summ => $state.composableBuilder(
      column: $state.table.summ,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BankOperationCategoryModelDriftModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $BankOperationCategoryModelDriftModelTable> {
  $$BankOperationCategoryModelDriftModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get summ => $state.composableBuilder(
      column: $state.table.summ,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$BankOperationCategoryModelDriftModelTableTableManager
    extends RootTableManager<
        _$AppDatabase,
        $BankOperationCategoryModelDriftModelTable,
        BankOperationCategoryModelDriftModelData,
        $$BankOperationCategoryModelDriftModelTableFilterComposer,
        $$BankOperationCategoryModelDriftModelTableOrderingComposer,
        $$BankOperationCategoryModelDriftModelTableCreateCompanionBuilder,
        $$BankOperationCategoryModelDriftModelTableUpdateCompanionBuilder,
        (
          BankOperationCategoryModelDriftModelData,
          BaseReferences<
              _$AppDatabase,
              $BankOperationCategoryModelDriftModelTable,
              BankOperationCategoryModelDriftModelData>
        ),
        BankOperationCategoryModelDriftModelData,
        PrefetchHooks Function()> {
  $$BankOperationCategoryModelDriftModelTableTableManager(
      _$AppDatabase db, $BankOperationCategoryModelDriftModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BankOperationCategoryModelDriftModelTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$BankOperationCategoryModelDriftModelTableOrderingComposer(
                  ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> summ = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              BankOperationCategoryModelDriftModelCompanion(
            id: id,
            title: title,
            summ: summ,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double summ,
            required DateTime date,
          }) =>
              BankOperationCategoryModelDriftModelCompanion.insert(
            id: id,
            title: title,
            summ: summ,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BankOperationCategoryModelDriftModelTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BankOperationCategoryModelDriftModelTable,
        BankOperationCategoryModelDriftModelData,
        $$BankOperationCategoryModelDriftModelTableFilterComposer,
        $$BankOperationCategoryModelDriftModelTableOrderingComposer,
        $$BankOperationCategoryModelDriftModelTableCreateCompanionBuilder,
        $$BankOperationCategoryModelDriftModelTableUpdateCompanionBuilder,
        (
          BankOperationCategoryModelDriftModelData,
          BaseReferences<
              _$AppDatabase,
              $BankOperationCategoryModelDriftModelTable,
              BankOperationCategoryModelDriftModelData>
        ),
        BankOperationCategoryModelDriftModelData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BankOperationDriftModelTableTableManager get bankOperationDriftModel =>
      $$BankOperationDriftModelTableTableManager(
          _db, _db.bankOperationDriftModel);
  $$BankOperationCategoryModelDriftModelTableTableManager
      get bankOperationCategoryModelDriftModel =>
          $$BankOperationCategoryModelDriftModelTableTableManager(
              _db, _db.bankOperationCategoryModelDriftModel);
}

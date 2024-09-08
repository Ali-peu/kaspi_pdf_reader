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
  static const VerificationMeta _categoryIDMeta =
      const VerificationMeta('categoryID');
  @override
  late final GeneratedColumn<int> categoryID = GeneratedColumn<int>(
      'category_i_d', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        typeOperation,
        purpose,
        categoryID,
        categoryName,
        date,
        updatedAt,
        summ,
        isExpenditure
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
    if (data.containsKey('category_i_d')) {
      context.handle(
          _categoryIDMeta,
          categoryID.isAcceptableOrUnknown(
              data['category_i_d']!, _categoryIDMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
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
      categoryID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_i_d']),
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      summ: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}summ'])!,
      isExpenditure: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_expenditure'])!,
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
  final int? categoryID;
  final String? categoryName;
  final String date;
  final String updatedAt;
  final double summ;
  final bool isExpenditure;
  const BankOperationDriftModelData(
      {required this.id,
      required this.typeOperation,
      required this.purpose,
      this.categoryID,
      this.categoryName,
      required this.date,
      required this.updatedAt,
      required this.summ,
      required this.isExpenditure});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type_operation'] = Variable<String>(typeOperation);
    map['purpose'] = Variable<String>(purpose);
    if (!nullToAbsent || categoryID != null) {
      map['category_i_d'] = Variable<int>(categoryID);
    }
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    map['date'] = Variable<String>(date);
    map['updated_at'] = Variable<String>(updatedAt);
    map['summ'] = Variable<double>(summ);
    map['is_expenditure'] = Variable<bool>(isExpenditure);
    return map;
  }

  BankOperationDriftModelCompanion toCompanion(bool nullToAbsent) {
    return BankOperationDriftModelCompanion(
      id: Value(id),
      typeOperation: Value(typeOperation),
      purpose: Value(purpose),
      categoryID: categoryID == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryID),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
      date: Value(date),
      updatedAt: Value(updatedAt),
      summ: Value(summ),
      isExpenditure: Value(isExpenditure),
    );
  }

  factory BankOperationDriftModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankOperationDriftModelData(
      id: serializer.fromJson<int>(json['id']),
      typeOperation: serializer.fromJson<String>(json['typeOperation']),
      purpose: serializer.fromJson<String>(json['purpose']),
      categoryID: serializer.fromJson<int?>(json['categoryID']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
      date: serializer.fromJson<String>(json['date']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      summ: serializer.fromJson<double>(json['summ']),
      isExpenditure: serializer.fromJson<bool>(json['isExpenditure']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'typeOperation': serializer.toJson<String>(typeOperation),
      'purpose': serializer.toJson<String>(purpose),
      'categoryID': serializer.toJson<int?>(categoryID),
      'categoryName': serializer.toJson<String?>(categoryName),
      'date': serializer.toJson<String>(date),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'summ': serializer.toJson<double>(summ),
      'isExpenditure': serializer.toJson<bool>(isExpenditure),
    };
  }

  BankOperationDriftModelData copyWith(
          {int? id,
          String? typeOperation,
          String? purpose,
          Value<int?> categoryID = const Value.absent(),
          Value<String?> categoryName = const Value.absent(),
          String? date,
          String? updatedAt,
          double? summ,
          bool? isExpenditure}) =>
      BankOperationDriftModelData(
        id: id ?? this.id,
        typeOperation: typeOperation ?? this.typeOperation,
        purpose: purpose ?? this.purpose,
        categoryID: categoryID.present ? categoryID.value : this.categoryID,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
        date: date ?? this.date,
        updatedAt: updatedAt ?? this.updatedAt,
        summ: summ ?? this.summ,
        isExpenditure: isExpenditure ?? this.isExpenditure,
      );
  BankOperationDriftModelData copyWithCompanion(
      BankOperationDriftModelCompanion data) {
    return BankOperationDriftModelData(
      id: data.id.present ? data.id.value : this.id,
      typeOperation: data.typeOperation.present
          ? data.typeOperation.value
          : this.typeOperation,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      categoryID:
          data.categoryID.present ? data.categoryID.value : this.categoryID,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      date: data.date.present ? data.date.value : this.date,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      summ: data.summ.present ? data.summ.value : this.summ,
      isExpenditure: data.isExpenditure.present
          ? data.isExpenditure.value
          : this.isExpenditure,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationDriftModelData(')
          ..write('id: $id, ')
          ..write('typeOperation: $typeOperation, ')
          ..write('purpose: $purpose, ')
          ..write('categoryID: $categoryID, ')
          ..write('categoryName: $categoryName, ')
          ..write('date: $date, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summ: $summ, ')
          ..write('isExpenditure: $isExpenditure')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, typeOperation, purpose, categoryID,
      categoryName, date, updatedAt, summ, isExpenditure);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankOperationDriftModelData &&
          other.id == this.id &&
          other.typeOperation == this.typeOperation &&
          other.purpose == this.purpose &&
          other.categoryID == this.categoryID &&
          other.categoryName == this.categoryName &&
          other.date == this.date &&
          other.updatedAt == this.updatedAt &&
          other.summ == this.summ &&
          other.isExpenditure == this.isExpenditure);
}

class BankOperationDriftModelCompanion
    extends UpdateCompanion<BankOperationDriftModelData> {
  final Value<int> id;
  final Value<String> typeOperation;
  final Value<String> purpose;
  final Value<int?> categoryID;
  final Value<String?> categoryName;
  final Value<String> date;
  final Value<String> updatedAt;
  final Value<double> summ;
  final Value<bool> isExpenditure;
  const BankOperationDriftModelCompanion({
    this.id = const Value.absent(),
    this.typeOperation = const Value.absent(),
    this.purpose = const Value.absent(),
    this.categoryID = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.date = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.summ = const Value.absent(),
    this.isExpenditure = const Value.absent(),
  });
  BankOperationDriftModelCompanion.insert({
    this.id = const Value.absent(),
    required String typeOperation,
    required String purpose,
    this.categoryID = const Value.absent(),
    this.categoryName = const Value.absent(),
    required String date,
    required String updatedAt,
    required double summ,
    required bool isExpenditure,
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
    Expression<int>? categoryID,
    Expression<String>? categoryName,
    Expression<String>? date,
    Expression<String>? updatedAt,
    Expression<double>? summ,
    Expression<bool>? isExpenditure,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (typeOperation != null) 'type_operation': typeOperation,
      if (purpose != null) 'purpose': purpose,
      if (categoryID != null) 'category_i_d': categoryID,
      if (categoryName != null) 'category_name': categoryName,
      if (date != null) 'date': date,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (summ != null) 'summ': summ,
      if (isExpenditure != null) 'is_expenditure': isExpenditure,
    });
  }

  BankOperationDriftModelCompanion copyWith(
      {Value<int>? id,
      Value<String>? typeOperation,
      Value<String>? purpose,
      Value<int?>? categoryID,
      Value<String?>? categoryName,
      Value<String>? date,
      Value<String>? updatedAt,
      Value<double>? summ,
      Value<bool>? isExpenditure}) {
    return BankOperationDriftModelCompanion(
      id: id ?? this.id,
      typeOperation: typeOperation ?? this.typeOperation,
      purpose: purpose ?? this.purpose,
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      date: date ?? this.date,
      updatedAt: updatedAt ?? this.updatedAt,
      summ: summ ?? this.summ,
      isExpenditure: isExpenditure ?? this.isExpenditure,
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
    if (categoryID.present) {
      map['category_i_d'] = Variable<int>(categoryID.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationDriftModelCompanion(')
          ..write('id: $id, ')
          ..write('typeOperation: $typeOperation, ')
          ..write('purpose: $purpose, ')
          ..write('categoryID: $categoryID, ')
          ..write('categoryName: $categoryName, ')
          ..write('date: $date, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('summ: $summ, ')
          ..write('isExpenditure: $isExpenditure')
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
  static const VerificationMeta _iconIDMeta = const VerificationMeta('iconID');
  @override
  late final GeneratedColumn<int> iconID = GeneratedColumn<int>(
      'icon_i_d', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [id, iconID, title, summ, date];
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
    if (data.containsKey('icon_i_d')) {
      context.handle(_iconIDMeta,
          iconID.isAcceptableOrUnknown(data['icon_i_d']!, _iconIDMeta));
    } else if (isInserting) {
      context.missing(_iconIDMeta);
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
      iconID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_i_d'])!,
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
  final int iconID;
  final String title;
  final double summ;
  final DateTime date;
  const BankOperationCategoryModelDriftModelData(
      {required this.id,
      required this.iconID,
      required this.title,
      required this.summ,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['icon_i_d'] = Variable<int>(iconID);
    map['title'] = Variable<String>(title);
    map['summ'] = Variable<double>(summ);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  BankOperationCategoryModelDriftModelCompanion toCompanion(bool nullToAbsent) {
    return BankOperationCategoryModelDriftModelCompanion(
      id: Value(id),
      iconID: Value(iconID),
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
      iconID: serializer.fromJson<int>(json['iconID']),
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
      'iconID': serializer.toJson<int>(iconID),
      'title': serializer.toJson<String>(title),
      'summ': serializer.toJson<double>(summ),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  BankOperationCategoryModelDriftModelData copyWith(
          {int? id,
          int? iconID,
          String? title,
          double? summ,
          DateTime? date}) =>
      BankOperationCategoryModelDriftModelData(
        id: id ?? this.id,
        iconID: iconID ?? this.iconID,
        title: title ?? this.title,
        summ: summ ?? this.summ,
        date: date ?? this.date,
      );
  BankOperationCategoryModelDriftModelData copyWithCompanion(
      BankOperationCategoryModelDriftModelCompanion data) {
    return BankOperationCategoryModelDriftModelData(
      id: data.id.present ? data.id.value : this.id,
      iconID: data.iconID.present ? data.iconID.value : this.iconID,
      title: data.title.present ? data.title.value : this.title,
      summ: data.summ.present ? data.summ.value : this.summ,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationCategoryModelDriftModelData(')
          ..write('id: $id, ')
          ..write('iconID: $iconID, ')
          ..write('title: $title, ')
          ..write('summ: $summ, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, iconID, title, summ, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankOperationCategoryModelDriftModelData &&
          other.id == this.id &&
          other.iconID == this.iconID &&
          other.title == this.title &&
          other.summ == this.summ &&
          other.date == this.date);
}

class BankOperationCategoryModelDriftModelCompanion
    extends UpdateCompanion<BankOperationCategoryModelDriftModelData> {
  final Value<int> id;
  final Value<int> iconID;
  final Value<String> title;
  final Value<double> summ;
  final Value<DateTime> date;
  const BankOperationCategoryModelDriftModelCompanion({
    this.id = const Value.absent(),
    this.iconID = const Value.absent(),
    this.title = const Value.absent(),
    this.summ = const Value.absent(),
    this.date = const Value.absent(),
  });
  BankOperationCategoryModelDriftModelCompanion.insert({
    this.id = const Value.absent(),
    required int iconID,
    required String title,
    required double summ,
    required DateTime date,
  })  : iconID = Value(iconID),
        title = Value(title),
        summ = Value(summ),
        date = Value(date);
  static Insertable<BankOperationCategoryModelDriftModelData> custom({
    Expression<int>? id,
    Expression<int>? iconID,
    Expression<String>? title,
    Expression<double>? summ,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (iconID != null) 'icon_i_d': iconID,
      if (title != null) 'title': title,
      if (summ != null) 'summ': summ,
      if (date != null) 'date': date,
    });
  }

  BankOperationCategoryModelDriftModelCompanion copyWith(
      {Value<int>? id,
      Value<int>? iconID,
      Value<String>? title,
      Value<double>? summ,
      Value<DateTime>? date}) {
    return BankOperationCategoryModelDriftModelCompanion(
      id: id ?? this.id,
      iconID: iconID ?? this.iconID,
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
    if (iconID.present) {
      map['icon_i_d'] = Variable<int>(iconID.value);
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
          ..write('iconID: $iconID, ')
          ..write('title: $title, ')
          ..write('summ: $summ, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $BankOperationCategoryLinkTable extends BankOperationCategoryLink
    with
        TableInfo<$BankOperationCategoryLinkTable,
            BankOperationCategoryLinkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BankOperationCategoryLinkTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bankOperationIdMeta =
      const VerificationMeta('bankOperationId');
  @override
  late final GeneratedColumn<int> bankOperationId = GeneratedColumn<int>(
      'bank_operation_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES bank_operation_drift_model(id)');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'REFERENCES bank_operation_category_model_drift_model(id)');
  @override
  List<GeneratedColumn> get $columns => [bankOperationId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bank_operation_category_link';
  @override
  VerificationContext validateIntegrity(
      Insertable<BankOperationCategoryLinkData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('bank_operation_id')) {
      context.handle(
          _bankOperationIdMeta,
          bankOperationId.isAcceptableOrUnknown(
              data['bank_operation_id']!, _bankOperationIdMeta));
    } else if (isInserting) {
      context.missing(_bankOperationIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BankOperationCategoryLinkData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BankOperationCategoryLinkData(
      bankOperationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bank_operation_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  $BankOperationCategoryLinkTable createAlias(String alias) {
    return $BankOperationCategoryLinkTable(attachedDatabase, alias);
  }
}

class BankOperationCategoryLinkData extends DataClass
    implements Insertable<BankOperationCategoryLinkData> {
  final int bankOperationId;
  final int categoryId;
  const BankOperationCategoryLinkData(
      {required this.bankOperationId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['bank_operation_id'] = Variable<int>(bankOperationId);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  BankOperationCategoryLinkCompanion toCompanion(bool nullToAbsent) {
    return BankOperationCategoryLinkCompanion(
      bankOperationId: Value(bankOperationId),
      categoryId: Value(categoryId),
    );
  }

  factory BankOperationCategoryLinkData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BankOperationCategoryLinkData(
      bankOperationId: serializer.fromJson<int>(json['bankOperationId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bankOperationId': serializer.toJson<int>(bankOperationId),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  BankOperationCategoryLinkData copyWith(
          {int? bankOperationId, int? categoryId}) =>
      BankOperationCategoryLinkData(
        bankOperationId: bankOperationId ?? this.bankOperationId,
        categoryId: categoryId ?? this.categoryId,
      );
  BankOperationCategoryLinkData copyWithCompanion(
      BankOperationCategoryLinkCompanion data) {
    return BankOperationCategoryLinkData(
      bankOperationId: data.bankOperationId.present
          ? data.bankOperationId.value
          : this.bankOperationId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationCategoryLinkData(')
          ..write('bankOperationId: $bankOperationId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bankOperationId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BankOperationCategoryLinkData &&
          other.bankOperationId == this.bankOperationId &&
          other.categoryId == this.categoryId);
}

class BankOperationCategoryLinkCompanion
    extends UpdateCompanion<BankOperationCategoryLinkData> {
  final Value<int> bankOperationId;
  final Value<int> categoryId;
  final Value<int> rowid;
  const BankOperationCategoryLinkCompanion({
    this.bankOperationId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BankOperationCategoryLinkCompanion.insert({
    required int bankOperationId,
    required int categoryId,
    this.rowid = const Value.absent(),
  })  : bankOperationId = Value(bankOperationId),
        categoryId = Value(categoryId);
  static Insertable<BankOperationCategoryLinkData> custom({
    Expression<int>? bankOperationId,
    Expression<int>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (bankOperationId != null) 'bank_operation_id': bankOperationId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BankOperationCategoryLinkCompanion copyWith(
      {Value<int>? bankOperationId,
      Value<int>? categoryId,
      Value<int>? rowid}) {
    return BankOperationCategoryLinkCompanion(
      bankOperationId: bankOperationId ?? this.bankOperationId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bankOperationId.present) {
      map['bank_operation_id'] = Variable<int>(bankOperationId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankOperationCategoryLinkCompanion(')
          ..write('bankOperationId: $bankOperationId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
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
  late final $BankOperationCategoryLinkTable bankOperationCategoryLink =
      $BankOperationCategoryLinkTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        bankOperationDriftModel,
        bankOperationCategoryModelDriftModel,
        bankOperationCategoryLink
      ];
}

typedef $$BankOperationDriftModelTableCreateCompanionBuilder
    = BankOperationDriftModelCompanion Function({
  Value<int> id,
  required String typeOperation,
  required String purpose,
  Value<int?> categoryID,
  Value<String?> categoryName,
  required String date,
  required String updatedAt,
  required double summ,
  required bool isExpenditure,
});
typedef $$BankOperationDriftModelTableUpdateCompanionBuilder
    = BankOperationDriftModelCompanion Function({
  Value<int> id,
  Value<String> typeOperation,
  Value<String> purpose,
  Value<int?> categoryID,
  Value<String?> categoryName,
  Value<String> date,
  Value<String> updatedAt,
  Value<double> summ,
  Value<bool> isExpenditure,
});

final class $$BankOperationDriftModelTableReferences extends BaseReferences<
    _$AppDatabase, $BankOperationDriftModelTable, BankOperationDriftModelData> {
  $$BankOperationDriftModelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BankOperationCategoryLinkTable,
      List<BankOperationCategoryLinkData>> _bankOperationCategoryLinkRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.bankOperationCategoryLink,
          aliasName: $_aliasNameGenerator(db.bankOperationDriftModel.id,
              db.bankOperationCategoryLink.bankOperationId));

  $$BankOperationCategoryLinkTableProcessedTableManager
      get bankOperationCategoryLinkRefs {
    final manager = $$BankOperationCategoryLinkTableTableManager(
            $_db, $_db.bankOperationCategoryLink)
        .filter((f) => f.bankOperationId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_bankOperationCategoryLinkRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  ColumnFilters<int> get categoryID => $state.composableBuilder(
      column: $state.table.categoryID,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
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

  ComposableFilter bankOperationCategoryLinkRefs(
      ComposableFilter Function(
              $$BankOperationCategoryLinkTableFilterComposer f)
          f) {
    final $$BankOperationCategoryLinkTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.bankOperationCategoryLink,
            getReferencedColumn: (t) => t.bankOperationId,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationCategoryLinkTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.bankOperationCategoryLink,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
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

  ColumnOrderings<int> get categoryID => $state.composableBuilder(
      column: $state.table.categoryID,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
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
}

class $$BankOperationDriftModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankOperationDriftModelTable,
    BankOperationDriftModelData,
    $$BankOperationDriftModelTableFilterComposer,
    $$BankOperationDriftModelTableOrderingComposer,
    $$BankOperationDriftModelTableCreateCompanionBuilder,
    $$BankOperationDriftModelTableUpdateCompanionBuilder,
    (BankOperationDriftModelData, $$BankOperationDriftModelTableReferences),
    BankOperationDriftModelData,
    PrefetchHooks Function({bool bankOperationCategoryLinkRefs})> {
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
            Value<int?> categoryID = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            Value<String> date = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<double> summ = const Value.absent(),
            Value<bool> isExpenditure = const Value.absent(),
          }) =>
              BankOperationDriftModelCompanion(
            id: id,
            typeOperation: typeOperation,
            purpose: purpose,
            categoryID: categoryID,
            categoryName: categoryName,
            date: date,
            updatedAt: updatedAt,
            summ: summ,
            isExpenditure: isExpenditure,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String typeOperation,
            required String purpose,
            Value<int?> categoryID = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            required String date,
            required String updatedAt,
            required double summ,
            required bool isExpenditure,
          }) =>
              BankOperationDriftModelCompanion.insert(
            id: id,
            typeOperation: typeOperation,
            purpose: purpose,
            categoryID: categoryID,
            categoryName: categoryName,
            date: date,
            updatedAt: updatedAt,
            summ: summ,
            isExpenditure: isExpenditure,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankOperationDriftModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bankOperationCategoryLinkRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bankOperationCategoryLinkRefs) db.bankOperationCategoryLink
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bankOperationCategoryLinkRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$BankOperationDriftModelTableReferences
                                ._bankOperationCategoryLinkRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankOperationDriftModelTableReferences(
                                    db, table, p0)
                                .bankOperationCategoryLinkRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.bankOperationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
        (BankOperationDriftModelData, $$BankOperationDriftModelTableReferences),
        BankOperationDriftModelData,
        PrefetchHooks Function({bool bankOperationCategoryLinkRefs})>;
typedef $$BankOperationCategoryModelDriftModelTableCreateCompanionBuilder
    = BankOperationCategoryModelDriftModelCompanion Function({
  Value<int> id,
  required int iconID,
  required String title,
  required double summ,
  required DateTime date,
});
typedef $$BankOperationCategoryModelDriftModelTableUpdateCompanionBuilder
    = BankOperationCategoryModelDriftModelCompanion Function({
  Value<int> id,
  Value<int> iconID,
  Value<String> title,
  Value<double> summ,
  Value<DateTime> date,
});

final class $$BankOperationCategoryModelDriftModelTableReferences
    extends BaseReferences<
        _$AppDatabase,
        $BankOperationCategoryModelDriftModelTable,
        BankOperationCategoryModelDriftModelData> {
  $$BankOperationCategoryModelDriftModelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BankOperationCategoryLinkTable,
      List<BankOperationCategoryLinkData>> _bankOperationCategoryLinkRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.bankOperationCategoryLink,
          aliasName: $_aliasNameGenerator(
              db.bankOperationCategoryModelDriftModel.id,
              db.bankOperationCategoryLink.categoryId));

  $$BankOperationCategoryLinkTableProcessedTableManager
      get bankOperationCategoryLinkRefs {
    final manager = $$BankOperationCategoryLinkTableTableManager(
            $_db, $_db.bankOperationCategoryLink)
        .filter((f) => f.categoryId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_bankOperationCategoryLinkRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$BankOperationCategoryModelDriftModelTableFilterComposer
    extends FilterComposer<_$AppDatabase,
        $BankOperationCategoryModelDriftModelTable> {
  $$BankOperationCategoryModelDriftModelTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get iconID => $state.composableBuilder(
      column: $state.table.iconID,
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

  ComposableFilter bankOperationCategoryLinkRefs(
      ComposableFilter Function(
              $$BankOperationCategoryLinkTableFilterComposer f)
          f) {
    final $$BankOperationCategoryLinkTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.bankOperationCategoryLink,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationCategoryLinkTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.bankOperationCategoryLink,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$BankOperationCategoryModelDriftModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase,
        $BankOperationCategoryModelDriftModelTable> {
  $$BankOperationCategoryModelDriftModelTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get iconID => $state.composableBuilder(
      column: $state.table.iconID,
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
          $$BankOperationCategoryModelDriftModelTableReferences
        ),
        BankOperationCategoryModelDriftModelData,
        PrefetchHooks Function({bool bankOperationCategoryLinkRefs})> {
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
            Value<int> iconID = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> summ = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              BankOperationCategoryModelDriftModelCompanion(
            id: id,
            iconID: iconID,
            title: title,
            summ: summ,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int iconID,
            required String title,
            required double summ,
            required DateTime date,
          }) =>
              BankOperationCategoryModelDriftModelCompanion.insert(
            id: id,
            iconID: iconID,
            title: title,
            summ: summ,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankOperationCategoryModelDriftModelTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({bankOperationCategoryLinkRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (bankOperationCategoryLinkRefs) db.bankOperationCategoryLink
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (bankOperationCategoryLinkRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$BankOperationCategoryModelDriftModelTableReferences
                                ._bankOperationCategoryLinkRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$BankOperationCategoryModelDriftModelTableReferences(
                                    db, table, p0)
                                .bankOperationCategoryLinkRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
          $$BankOperationCategoryModelDriftModelTableReferences
        ),
        BankOperationCategoryModelDriftModelData,
        PrefetchHooks Function({bool bankOperationCategoryLinkRefs})>;
typedef $$BankOperationCategoryLinkTableCreateCompanionBuilder
    = BankOperationCategoryLinkCompanion Function({
  required int bankOperationId,
  required int categoryId,
  Value<int> rowid,
});
typedef $$BankOperationCategoryLinkTableUpdateCompanionBuilder
    = BankOperationCategoryLinkCompanion Function({
  Value<int> bankOperationId,
  Value<int> categoryId,
  Value<int> rowid,
});

final class $$BankOperationCategoryLinkTableReferences extends BaseReferences<
    _$AppDatabase,
    $BankOperationCategoryLinkTable,
    BankOperationCategoryLinkData> {
  $$BankOperationCategoryLinkTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $BankOperationDriftModelTable _bankOperationIdTable(
          _$AppDatabase db) =>
      db.bankOperationDriftModel.createAlias($_aliasNameGenerator(
          db.bankOperationCategoryLink.bankOperationId,
          db.bankOperationDriftModel.id));

  $$BankOperationDriftModelTableProcessedTableManager? get bankOperationId {
    if ($_item.bankOperationId == null) return null;
    final manager = $$BankOperationDriftModelTableTableManager(
            $_db, $_db.bankOperationDriftModel)
        .filter((f) => f.id($_item.bankOperationId!));
    final item = $_typedResult.readTableOrNull(_bankOperationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $BankOperationCategoryModelDriftModelTable _categoryIdTable(
          _$AppDatabase db) =>
      db.bankOperationCategoryModelDriftModel.createAlias($_aliasNameGenerator(
          db.bankOperationCategoryLink.categoryId,
          db.bankOperationCategoryModelDriftModel.id));

  $$BankOperationCategoryModelDriftModelTableProcessedTableManager?
      get categoryId {
    if ($_item.categoryId == null) return null;
    final manager = $$BankOperationCategoryModelDriftModelTableTableManager(
            $_db, $_db.bankOperationCategoryModelDriftModel)
        .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BankOperationCategoryLinkTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BankOperationCategoryLinkTable> {
  $$BankOperationCategoryLinkTableFilterComposer(super.$state);
  $$BankOperationDriftModelTableFilterComposer get bankOperationId {
    final $$BankOperationDriftModelTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.bankOperationId,
            referencedTable: $state.db.bankOperationDriftModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationDriftModelTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.bankOperationDriftModel,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$BankOperationCategoryModelDriftModelTableFilterComposer get categoryId {
    final $$BankOperationCategoryModelDriftModelTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $state.db.bankOperationCategoryModelDriftModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationCategoryModelDriftModelTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.bankOperationCategoryModelDriftModel,
                        joinBuilder,
                        parentComposers)));
    return composer;
  }
}

class $$BankOperationCategoryLinkTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BankOperationCategoryLinkTable> {
  $$BankOperationCategoryLinkTableOrderingComposer(super.$state);
  $$BankOperationDriftModelTableOrderingComposer get bankOperationId {
    final $$BankOperationDriftModelTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.bankOperationId,
            referencedTable: $state.db.bankOperationDriftModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationDriftModelTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.bankOperationDriftModel,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$BankOperationCategoryModelDriftModelTableOrderingComposer get categoryId {
    final $$BankOperationCategoryModelDriftModelTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $state.db.bankOperationCategoryModelDriftModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$BankOperationCategoryModelDriftModelTableOrderingComposer(
                    ComposerState(
                        $state.db,
                        $state.db.bankOperationCategoryModelDriftModel,
                        joinBuilder,
                        parentComposers)));
    return composer;
  }
}

class $$BankOperationCategoryLinkTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BankOperationCategoryLinkTable,
    BankOperationCategoryLinkData,
    $$BankOperationCategoryLinkTableFilterComposer,
    $$BankOperationCategoryLinkTableOrderingComposer,
    $$BankOperationCategoryLinkTableCreateCompanionBuilder,
    $$BankOperationCategoryLinkTableUpdateCompanionBuilder,
    (BankOperationCategoryLinkData, $$BankOperationCategoryLinkTableReferences),
    BankOperationCategoryLinkData,
    PrefetchHooks Function({bool bankOperationId, bool categoryId})> {
  $$BankOperationCategoryLinkTableTableManager(
      _$AppDatabase db, $BankOperationCategoryLinkTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$BankOperationCategoryLinkTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$BankOperationCategoryLinkTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> bankOperationId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BankOperationCategoryLinkCompanion(
            bankOperationId: bankOperationId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int bankOperationId,
            required int categoryId,
            Value<int> rowid = const Value.absent(),
          }) =>
              BankOperationCategoryLinkCompanion.insert(
            bankOperationId: bankOperationId,
            categoryId: categoryId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BankOperationCategoryLinkTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {bankOperationId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (bankOperationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.bankOperationId,
                    referencedTable: $$BankOperationCategoryLinkTableReferences
                        ._bankOperationIdTable(db),
                    referencedColumn: $$BankOperationCategoryLinkTableReferences
                        ._bankOperationIdTable(db)
                        .id,
                  ) as T;
                }
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable: $$BankOperationCategoryLinkTableReferences
                        ._categoryIdTable(db),
                    referencedColumn: $$BankOperationCategoryLinkTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BankOperationCategoryLinkTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $BankOperationCategoryLinkTable,
        BankOperationCategoryLinkData,
        $$BankOperationCategoryLinkTableFilterComposer,
        $$BankOperationCategoryLinkTableOrderingComposer,
        $$BankOperationCategoryLinkTableCreateCompanionBuilder,
        $$BankOperationCategoryLinkTableUpdateCompanionBuilder,
        (
          BankOperationCategoryLinkData,
          $$BankOperationCategoryLinkTableReferences
        ),
        BankOperationCategoryLinkData,
        PrefetchHooks Function({bool bankOperationId, bool categoryId})>;

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
  $$BankOperationCategoryLinkTableTableManager get bankOperationCategoryLink =>
      $$BankOperationCategoryLinkTableTableManager(
          _db, _db.bankOperationCategoryLink);
}

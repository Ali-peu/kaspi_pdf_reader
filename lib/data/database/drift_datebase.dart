import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'drift_datebase.g.dart';

class BankOperationDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeOperation => text().withLength(min: 6, max: 100)();
  TextColumn get purpose => text()();
  TextColumn get date => text()();
  TextColumn get updatedAt => text()();
  RealColumn get summ => real()();
  BoolColumn get isExpenditure => boolean()();
  TextColumn get categoryName => text().nullable()();
}

class BankOperationCategoryModelDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get summ => real()();
  DateTimeColumn get date => dateTime()();
}

@DriftDatabase(
    tables: [BankOperationDriftModel, BankOperationCategoryModelDriftModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'database');
  }
}

class BankOperationDriftModelRepository {
  final AppDatabase appDatabase;

  BankOperationDriftModelRepository({required this.appDatabase});
  Future<BankOperationDriftModelData?> getBankOperationDriftModelWithID(
      int id) async {
    final query = appDatabase.select(appDatabase.bankOperationDriftModel)
      ..where((tbl) => tbl.id.equals(id));
    final result = await query.getSingleOrNull();
    return result;
  }
    Future<List<BankOperationDriftModelData>?> getAllBankOperationDriftModel() async {
    final result = await appDatabase.select(appDatabase.bankOperationDriftModel).get();

    return result;
  }

  Future<void> setBankOperationDriftModel(
      BankOperationDriftModelCompanion model) async {
    await appDatabase.into(appDatabase.bankOperationDriftModel).insert(model);
  }
}

class BankOperationCategoryModelDriftModelRepository {
  final AppDatabase appDatabase;

  BankOperationCategoryModelDriftModelRepository({required this.appDatabase});
  Future<BankOperationCategoryModelDriftModelData?>
      getBankOperationGroupsDriftModelWithID(int id) async {
    final query = appDatabase
        .select(appDatabase.bankOperationCategoryModelDriftModel)
      ..where((tbl) => tbl.id.equals(id));
    final result = await query.getSingleOrNull();
    return result;
  }

  Future<void> setBankOperationGroupsDriftModel(
      BankOperationCategoryModelDriftModelCompanion model) async {
    appDatabase
        .into(appDatabase.bankOperationCategoryModelDriftModel)
        .insert(model);
  }

  Future<List<BankOperationCategoryModelDriftModelData>>
      getListBankOperationGroupsDriftModel() async {
    final list = appDatabase
        .select(appDatabase.bankOperationCategoryModelDriftModel)
        .get();
    return list;
  }
}

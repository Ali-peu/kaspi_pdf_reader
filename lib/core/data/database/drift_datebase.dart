import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:kaspi_pdf_reader/core/data/models/bank_operation_category_link_model/bank_operation_category_link_model.dart';

part 'drift_datebase.g.dart';

class DailyExpenseDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable().withLength(min: 0, max: 255)();
  TextColumn get paymentMethod =>
      text().nullable().withLength(min: 0, max: 50)();
  BoolColumn get isRecurring => boolean().nullable()();
  TextColumn get location => text().nullable().withLength(min: 0, max: 100)();
  TextColumn get currency => text().nullable().withLength(min: 3, max: 3)();
}

class BankOperationDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeOperation => text().withLength(min: 6, max: 100)();
  TextColumn get purpose => text()();
  IntColumn get categoryID => integer().nullable()();
  TextColumn get categoryName => text().nullable()();
  TextColumn get date => text()();
  TextColumn get updatedAt => text()();
  RealColumn get summ => real()();
  BoolColumn get isExpenditure => boolean()();
}

class BankOperationCategoryModelDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get iconID => integer()();
  TextColumn get title => text()();
  RealColumn get summ => real()();
  DateTimeColumn get date => dateTime()();
}

class BankOperationCategoryLink extends Table {
  IntColumn get bankOperationId => integer().customConstraint(
      'REFERENCES bank_operation_drift_model(id)')(); // Убираем дополнительные ограничения
  IntColumn get categoryId => integer().customConstraint(
      'REFERENCES bank_operation_category_model_drift_model(id)')(); // Убираем дополнительные ограничения
}

@DriftDatabase(tables: [
  DailyExpenseDriftModel,
  BankOperationDriftModel,
  BankOperationCategoryModelDriftModel,
  BankOperationCategoryLink
])
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

  Future<List<BankOperationDriftModelData>?>
      getAllBankOperationDriftModel() async {
    final result =
        await appDatabase.select(appDatabase.bankOperationDriftModel).get();

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

  Future<int> setBankOperationGroupsDriftModel(
      BankOperationCategoryModelDriftModelCompanion model) async {
    final id = appDatabase
        .into(appDatabase.bankOperationCategoryModelDriftModel)
        .insert(model);
    return id;
  }

  Future<List<BankOperationCategoryModelDriftModelData>>
      getListBankOperationGroupsDriftModel() async {
    final list = appDatabase
        .select(appDatabase.bankOperationCategoryModelDriftModel)
        .get();
    return list;
  }
}

class BankOperationCategoryLinkRepository {
  final AppDatabase appDatabase;

  BankOperationCategoryLinkRepository({required this.appDatabase});
  Future<void> linkOperationToCategory({
    required int bankOperationId,
    required int categoryId,
  }) async {
    await appDatabase.into(appDatabase.bankOperationCategoryLink).insert(
          BankOperationCategoryLinkCompanion(
            bankOperationId: Value(bankOperationId),
            categoryId: Value(categoryId),
          ),
        );
  }

  Future<List<BankOperationCategoryLinkModel>>
      getBankOperationsWhereHaveLinkToCategory({
    required int categoryId,
  }) async {
    final data =
        await appDatabase.select(appDatabase.bankOperationCategoryLink).get()
          ..where((e) => e.categoryId == categoryId);
    return data
        .map((e) => BankOperationCategoryLinkModel.fromDriftModel(e))
        .toList();
  }
}

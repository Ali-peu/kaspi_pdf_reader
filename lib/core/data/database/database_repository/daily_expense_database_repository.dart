import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';

class DailyExpenseDatabaseRepository {
  final AppDatabase appDatabase;

  const DailyExpenseDatabaseRepository(this.appDatabase);

  Future<List<DailyExpenseDriftModelData>?> getListDailyExpense() async {
    final data =
        await appDatabase.select(appDatabase.dailyExpenseDriftModel).get();
    return data;
  }

  Future<DailyExpenseDriftModelData?> getDailyExpenseFromID(
      {required int id}) async {
    final data = (appDatabase.select(appDatabase.dailyExpenseDriftModel)
      ..where((tbl) => tbl.id.equals(id)));
    final result = await data.getSingleOrNull();
    return result;
  }

  Future<int?> setDailyExpenseFromID(
      {required DailyExpenseDriftModelCompanion dataCompanion}) async {
    final data = await appDatabase
        .into(appDatabase.dailyExpenseDriftModel)
        .insert(dataCompanion)
        .then((value) {
      return value;
    });
    return data;
  }
}

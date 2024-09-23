import 'package:kaspi_pdf_reader/core/data/database/database_repository/daily_expense_database_repository.dart';
import 'package:kaspi_pdf_reader/core/data/models/daily_expense/daily_expense.dart';

class DailyExpenseRepository {
  final DailyExpenseDatabaseRepository _databaseRepository;

  const DailyExpenseRepository({required DailyExpenseDatabaseRepository databaseRepository}): _databaseRepository = databaseRepository;

  Future<DailyExpense?> getDailyExpenseWithID({required int id}) async {
    final data = await _databaseRepository.getDailyExpenseFromID(id: id);
    if (data != null) return DailyExpense.fromData(data);
    return null;
  }

  Future<List<DailyExpense>?> getListDailyExpense() async {
    final data = await _databaseRepository.getListDailyExpense();
    if (data != null) return data.map(DailyExpense.fromData).toList();

    return null;
  }

  Future<int?> setDailyExpense({
    required String comment,
    required String category,
    required double amount,
    required DateTime date,
  }) async {
    final dailyExpense =
        DailyExpense(id: 0, amount: amount, category: category, date: date);
    final data = await _databaseRepository.setDailyExpenseFromID(
        dataCompanion: dailyExpense.toCompanion());
    return data;
  }
}

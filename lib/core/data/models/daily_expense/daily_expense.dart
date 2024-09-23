import 'package:drift/drift.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';

class DailyExpense {
  final int id;
  final double amount;
  final String category;
  final DateTime date;
  final String? notes;
  // Способ оплаты (необязательное поле, например, "Наличные", "Карта")
  final String? paymentMethod;
  // Повторяющийся ли расход (необязательное поле)
  final bool? isRecurring; // По идее это должно само определятся
  // Место покупки (необязательное поле)
  final String? location;
  // Валюта расхода (например, "KZT", "USD") (необязательное поле)
  final String? currency;


  DailyExpense({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    this.notes,
    this.paymentMethod,
    this.isRecurring,
    this.location,
    this.currency,
  });

  @override
  String toString() {
    return 'Expense(id: $id, amount: $amount, category: $category, date: $date, '
        'notes: $notes, paymentMethod: $paymentMethod, isRecurring: $isRecurring, '
        'location: $location, currency: $currency)';
  }

   DailyExpenseDriftModelCompanion toCompanion() {
    return DailyExpenseDriftModelCompanion(
      id: Value(id),
      amount: Value(amount),
      category: Value(category),
      date: Value(date),
      notes: notes != null ? Value(notes) : const Value.absent(),
      paymentMethod: paymentMethod != null ? Value(paymentMethod) : const Value.absent(),
      isRecurring: isRecurring != null ? Value(isRecurring) : const Value.absent(),
      location: location != null ? Value(location) : const Value.absent(),
      currency: currency != null ? Value(currency) : const Value.absent(),
    );
  }

  factory DailyExpense.fromData(DailyExpenseDriftModelData data) {
    return DailyExpense(
      id: data.id,
      amount: data.amount,
      category: data.category,
      date: data.date,
      notes: data.notes,
      paymentMethod: data.paymentMethod,
      isRecurring: data.isRecurring,
      location: data.location,
      currency: data.currency,
    );
  }
}

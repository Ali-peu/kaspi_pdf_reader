import 'package:drift/drift.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';

class BankOperationModel {
  final String date;
  final double summ;
  final String typeOperation;
  final String purpose;
  final bool isPlus;
  final String? categoryName;
  final int? categoryID;
  final int id;

  BankOperationModel(
      {required this.date,
      required this.summ,
      required this.id,
      required this.isPlus,
      this.categoryID,
      this.categoryName,
      required this.typeOperation,
      required this.purpose});

  BankOperationModel copyWith(
      {String? date, double? summ, String? typeOperation, String? purpose}) {
    return BankOperationModel(
        id: id,
        categoryName: categoryName,
        date: date ?? this.date,
        isPlus: isPlus,
        categoryID: categoryID,
        summ: summ ?? this.summ,
        typeOperation: typeOperation ?? this.typeOperation,
        purpose: purpose ?? this.purpose);
  }

  static BankOperationModel getFromDriftModel(
      BankOperationDriftModelData model) {
    final date = model.date;
    final summ = model.summ;
    final isPlus = model.isExpenditure;
    final purpose = model.purpose;
    final typeOperation = model.typeOperation;
    final categoryName = model.categoryName;
    final id = model.id;
    final categoryID = model.categoryID;

    return BankOperationModel(
        date: date,
        summ: summ,
        id: id,
        categoryName: categoryName,
        isPlus: isPlus,
        categoryID: categoryID,
        typeOperation: typeOperation,
        purpose: purpose);
  }

  BankOperationDriftModelCompanion toBankOperationDriftModelData() {
    return BankOperationDriftModelCompanion(
        date: Value<String>(date),
        categoryName: Value<String?>(categoryName),
        isExpenditure: Value<bool>(isPlus),
        typeOperation: Value<String>(typeOperation),
        summ: Value<double>(summ),
        updatedAt: Value<String>(date),
        categoryID: Value<int?>(categoryID),
        purpose: Value<String>(purpose));
  }
}

import 'package:drift/drift.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';

class BankOperationCategoryLinkModel {
  final int categoryID;
  final int operationID;

  const BankOperationCategoryLinkModel(
      {required this.categoryID, required this.operationID});

  static BankOperationCategoryLinkModel fromDriftModel(
      BankOperationCategoryLinkData data) {
    return BankOperationCategoryLinkModel(
        categoryID: data.categoryId, operationID: data.bankOperationId);
  }

  static BankOperationCategoryLinkCompanion toDriftModel(
      BankOperationCategoryLinkModel data) {
    return BankOperationCategoryLinkCompanion(
        categoryId: Value<int>(data.categoryID),
        bankOperationId: Value<int>(data.operationID));
  }
}

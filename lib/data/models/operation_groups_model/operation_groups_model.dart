import 'package:drift/drift.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';

class OperationGroupsModel {
  final String name;
  final int iconID;
  final int? id;
  final double summ;
  final DateTime createdDate;

  OperationGroupsModel(
      {required this.name,
      required this.summ,
      this.id,
      required this.iconID,
      required this.createdDate});

  static OperationGroupsModel getFromDriftModel(
      BankOperationCategoryModelDriftModelData model) {
    final name = model.title;
    final id = model.id;
    final date = model.date;
    final summ = model.summ;
    return OperationGroupsModel(
        name: name,
        createdDate: date,
        id: id,
        summ: summ,
        iconID: model.iconID);
  }

  static BankOperationCategoryModelDriftModelCompanion toDriftModel(
      OperationGroupsModel model) {
    return BankOperationCategoryModelDriftModelCompanion(
        title: Value<String>(model.name),
        date: Value<DateTime>(model.createdDate),
        iconID: Value<int>(model.iconID),
        summ: Value<double>(model.summ));
  }
}

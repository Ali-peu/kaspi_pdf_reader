import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/core/data/models/bank_operation_model.dart';

class BankOperationRepo {
  final bankOperationDriftModelRepository =
      BankOperationDriftModelRepository(appDatabase: driftDatebase);
  Map<String, List<BankOperationModel>> doGroups(
      List<BankOperationModel?> data) {
    Map<String, List<BankOperationModel>> groupedData = {};

    for (var element in data) {
      if (element != null) {
        String purpose = element.purpose.trim().toUpperCase();
        if (!groupedData.containsKey(purpose)) {
          groupedData[purpose] = [];
        }
        groupedData[purpose]!.add(element);
      }
    }

    return groupedData;
  }

  Future<List<BankOperationModel>> saveIntoDriftAndGetWithID(
      List<BankOperationModel?> data) async {
    for (final e in data) {
      if (e != null) {
        await bankOperationDriftModelRepository
            .setBankOperationDriftModel(e.toBankOperationDriftModelData());
      }
    }

    final getDataFromDrift =
        await bankOperationDriftModelRepository.getAllBankOperationDriftModel();

    final result = getDataFromDrift
        ?.map((e) => BankOperationModel.getFromDriftModel(e))
        .toList();

    return result ?? [];
  }

  Future<List<BankOperationModel>> getFromDrift() async {
    final getDataFromDrift =
        await bankOperationDriftModelRepository.getAllBankOperationDriftModel();

    final result = getDataFromDrift
        ?.map((e) => BankOperationModel.getFromDriftModel(e))
        .toList();

    return result ?? [];
  }

  Future<void> createBankOperationModel({
    required String name,
    required String iconID,
    required double summ,
    required String date,
    required String comment,
    required String typeOperation,
    bool isPlus = false,
  }) async {
    await bankOperationDriftModelRepository.setBankOperationDriftModel(
        BankOperationModel(
                date: date,
                summ: summ,
                id: 0,
                isPlus: isPlus,
                typeOperation: typeOperation,
                purpose: comment)
            .toBankOperationDriftModelData());
  }
}

import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';

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
}

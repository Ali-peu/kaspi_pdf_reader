import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/models/operation_groups_model/operation_groups_model.dart';

class OperationGroupsRepo {
  final BankOperationCategoryModelDriftModelRepository
      bankOperationCategoryModelDriftModelRepository;

  OperationGroupsRepo(
      {required this.bankOperationCategoryModelDriftModelRepository});

  Future<List<OperationGroupsModel>> getListModelListFromDrift() async {
    final data = await bankOperationCategoryModelDriftModelRepository
        .getListBankOperationGroupsDriftModel();
    final result =
        data.map((e) => OperationGroupsModel.getFromDriftModel(e)).toList();
    return result;
  }
}

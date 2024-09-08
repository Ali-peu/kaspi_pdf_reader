import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase_example.dart';
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

  Future<bool> checkIsThisGroupExisted(String groupName) async {
    final data = await bankOperationCategoryModelDriftModelRepository
        .getListBankOperationGroupsDriftModel();

    for (var element in data) {
      if (element.title.toUpperCase().trim() ==
          groupName.toUpperCase().trim()) {
        return true;
      }
    }

    return false;
  }

  Future<int> setBankOperationModel(
      {required String groupName,
      required int iconID,
      required double summ}) async {
    final model = OperationGroupsModel(
        name: groupName,
        summ: summ,
        createdDate: (DateTime.now()),
        iconID: iconID);
    final id = await bankOperationCategoryModelDriftModelRepository
        .setBankOperationGroupsDriftModel(
            OperationGroupsModel.toDriftModel(model));
    return id;
  }

  Future<void> linkOperationToCategory({
    required int bankOperationId,
    required int categoryId,
  }) async {
    await BankOperationCategoryLinkRepository(appDatabase: driftDatebase)
        .linkOperationToCategory(
            bankOperationId: bankOperationId, categoryId: categoryId);
  }
}

import 'package:kaspi_pdf_reader/app/app_change_notifier.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';

class OperationDetailController extends AppChangeNotifier {
  List<BankOperationModel> bankOperationModelList = [];

  bool isLoading = true;

  
  final BankOperationDriftModelRepository bankOperationDriftModelRepository;


  OperationDetailController({required this.bankOperationDriftModelRepository});

  void setUp() {}

  Future<void> loadBankOperations(int groupID) async {
    final data = await BankOperationCategoryLinkRepository(appDatabase: driftDatebase)
        .getBankOperationsWhereHaveLinkToCategory(categoryId: groupID);

    final operationsListID = data.map((e) => e.operationID).toList();
    for (var element in operationsListID) {
      final result = await bankOperationDriftModelRepository
          .getBankOperationDriftModelWithID(element);
      if (result != null) {
        bankOperationModelList
            .add(BankOperationModel.getFromDriftModel(result));
      }
    }

    isLoading = false;
    notifyListeners();
  }
}

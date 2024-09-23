import 'package:kaspi_pdf_reader/app/app_change_notifier.dart';
import 'package:kaspi_pdf_reader/core/data/models/operation_groups_model/operation_groups_model.dart';
import 'package:kaspi_pdf_reader/core/data/repo/operation_groups_repo.dart';

class SortingOperationsController extends AppChangeNotifier {
  SortingOperationsController({required this.operationGroupsRepo});

  final OperationGroupsRepo operationGroupsRepo;

  List<OperationGroupsModel> _operations = [];
  List<OperationGroupsModel> get operations => List.unmodifiable(_operations);

  Future<void> getGroupsFromDrift() async {
    if (_operations.isNotEmpty) _operations.clear();
    _operations = await operationGroupsRepo.getListModelListFromDrift();
    notifyListeners();
  }
}

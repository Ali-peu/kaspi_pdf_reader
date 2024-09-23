import 'package:kaspi_pdf_reader/core/data/models/bank_operation_model.dart';

abstract class DocumentCleanerRepo<T,L> {
  List<BankOperationModel?> parseDateFromList(T parsedData);
  BankOperationModel? getFROMString(L input);
}

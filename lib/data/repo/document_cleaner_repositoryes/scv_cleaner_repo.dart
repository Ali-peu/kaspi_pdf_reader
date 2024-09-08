import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';
import 'package:kaspi_pdf_reader/data/repo/document_cleaner_repositoryes/document_cleaner_repo.dart';

class SCVCleanerRepo
    implements DocumentCleanerRepo<List<List<String>>, List<String>> {
  @override
  List<BankOperationModel?> parseDateFromList(List<List<String>>? parsedData) {
    final data = parsedData!
        .where((e) =>
            e.isNotEmpty &&
            e.first.isNotEmpty &&
            !e.first.contains('JSC') &&
            !e.first.contains(
                'The amount is blocked. The bank expects the confirmation of the payment system'))
        .toList();

    final List<List<String>> classteredData = data.map((e) {
      if (e.first.split('\n').length > 2) {
        return e.first.split(RegExp(r'\s+')).toList();
      } else {
        return e; // Возвращаем исходный элемент, если строк меньше 3
      }
    }).toList();
    final List<List<String>> newClassteredData =
        classteredData.map((e) => e..removeWhere((e) => e.isEmpty)).toList();
    final List<List<String>> superNewClassteredData = newClassteredData
      ..removeWhere((e) => e.isEmpty);

    final bankOperations = superNewClassteredData
        .map((e) => getFROMString(e))
        .toList()
      ..removeWhere((e) => e == null);

    return bankOperations;
  }

  @override
  BankOperationModel? getFROMString(List<String> input) {
    final src = input..removeWhere((e) => e.isEmpty);
    List<String> match = src.first.split('   ');
    match.removeWhere((e) => e.isEmpty);
    if (match.length < 2) {
      return null;
    }

    String date = match[0];
    String amount = (match[1]);
    String type = match[2];
    String client = match[3];

    String formattedAmount = amount
        .replaceAll(',', '.')
        .replaceFirst('₸', '')
        .replaceFirst('-', '')
        .replaceFirst('+', '');

    double sum = double.parse(formattedAmount.replaceAll(' ', ''));
    return BankOperationModel(
        date: date,
        summ: sum,
        typeOperation: type,
        id: 0,
        isPlus: amount.contains('+'),
        purpose: client.toString());
  }
}

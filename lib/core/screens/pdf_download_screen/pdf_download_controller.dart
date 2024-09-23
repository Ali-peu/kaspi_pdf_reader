import 'dart:developer';
import 'dart:io';

import 'package:fast_csv/fast_csv_ex.dart' as fast_csv_ex;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';
import 'package:kaspi_pdf_reader/data/repo/bank_operation_repo.dart';
import 'package:kaspi_pdf_reader/data/repo/document_cleaner_repositoryes/document_cleaner_repo.dart';
import 'package:kaspi_pdf_reader/data/repo/operation_groups_repo.dart';

class PdfDownloadController extends ChangeNotifier {
  bool isLoading = true;
  bool showCheckBox = false;

  int pickedIconDataID = 0;

  UniqueKey listViewKey = UniqueKey();

  final TextEditingController controller = TextEditingController();

  List<BankOperationModel?>? bankOperations = [];
  Map<String, List<BankOperationModel>> groupedDataExpenditure = {};
  Map<String, List<BankOperationModel>> pickedGroupedDataExpenditure = {};

  final BankOperationRepo bankOperationRepo;
  // ignore: strict_raw_type
  final DocumentCleanerRepo pdfCleanerRepo;
  final OperationGroupsRepo operationGroupsRepo;

  PdfDownloadController(
      {required this.operationGroupsRepo,
      required this.bankOperationRepo,
      required this.pdfCleanerRepo});

  Future<void> openPdfFromPath() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final files = result.paths.map((path) => File(path!)).toList();
      final doc = files.first;
      final text = await doc.readAsString();
      final data = fast_csv_ex.parse(text);
      final sortData =
          data.sublist(data.indexWhere((e) => e.first.contains('Date')) + 1);
      final parsedData = sortData;
      isLoading = false;
      final getBankoperationList = pdfCleanerRepo.parseDateFromList(parsedData);

      bankOperations = await bankOperationRepo
          .saveIntoDriftAndGetWithID(getBankoperationList);

      doGroupsForExpenditure();
      notifyListeners();
    }
  }

  Future<void> getDataFromDrift() async {
    bankOperations = await bankOperationRepo.getFromDrift();
    doGroupsForExpenditure();
    isLoading = false;
    notifyListeners();
  }

  Future<void> saveForCategoryType() async {
    final checkIsThisGroupTypeExisted =
        await operationGroupsRepo.checkIsThisGroupExisted(controller.text);
    if (checkIsThisGroupTypeExisted) {
    } else {
      final summ = pickedGroupedDataExpenditure.values
          .expand((list) => list)
          .fold(0.0, (previousValue, element) => previousValue + element.summ);
      final newCategoryId = await operationGroupsRepo.setBankOperationModel(
          groupName: controller.text, iconID: pickedIconDataID, summ: summ);
      saveManyToManyKeysInOperationAndGroups(newCategoryId);
    }
  }

  void saveManyToManyKeysInOperationAndGroups(int newCategoryId) async {
    for (var entry in pickedGroupedDataExpenditure.entries) {
      for (var operation in entry.value) {
        await operationGroupsRepo.linkOperationToCategory(
          bankOperationId: operation.id,
          categoryId: newCategoryId,
        );
      }
    }
  }

  bool checkExpenditureNameInMap() {
    log(groupedDataExpenditure.keys.toList().toString());
    return (groupedDataExpenditure.keys
        .contains(controller.text.toUpperCase()));
  }

  void clearTextField() {
    controller.clear();
    notifyListeners();
  }

  void setPickedIconDataID(int value) {
    pickedIconDataID = value;
    notifyListeners();
  }

  void clearPickedGroupedDataExpenditure() {
    showCheckBox = false;
    pickedGroupedDataExpenditure.clear();
    notifyListeners();
  }

  void setShowCheckBox() async {
    showCheckBox = !showCheckBox;
    pickedGroupedDataExpenditure.clear();
    notifyListeners();
  }

  void createNewtypeOfGroupsForExpenditure() {
    final List<BankOperationModel> data =
        pickedGroupedDataExpenditure.values.expand((list) => list).toList();
    groupedDataExpenditure.removeWhere(
        (key, value) => pickedGroupedDataExpenditure.keys.contains(key));
    groupedDataExpenditure[controller.text.toUpperCase()] = data;
    listViewKey = UniqueKey();
    notifyListeners();
  }

  void addPickedExpenditureValue(String key, List<BankOperationModel> value) {
    pickedGroupedDataExpenditure[key] = value;
    notifyListeners();
  }

  void removePickedExpenditureValue(String key) {
    pickedGroupedDataExpenditure.remove(key);
    notifyListeners();
  }

  void doGroupsForExpenditure() async {
    groupedDataExpenditure = bankOperationRepo
        .doGroups(bankOperations?.where((e) => !e!.isPlus).toList() ?? []);
  }

  String getPlusSum() {
    if (bankOperations != null) {
      double summ = 0.0;
      for (var element in bankOperations!) {
        if (element != null && element.isPlus) {
          summ += element.summ;
        }
      }
      return summ.toString();
    } else {
      return '0';
    }
  }

  String getMinusSum() {
    if (bankOperations != null) {
      double summ = 0.0;
      for (var element in bankOperations!) {
        if (element != null && !element.isPlus) {
          summ += element.summ;
        }
      }
      return summ.toString();
    } else {
      return '0';
    }
  }

  Future<void> diposeData() async {
    isLoading = true;
    bankOperations = null;
    notifyListeners();
  }
}

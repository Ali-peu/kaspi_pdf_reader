import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fast_csv/fast_csv_ex.dart' as fast_csv_ex;
import 'package:kaspi_pdf_reader/data/models/bank_operation_model.dart';

class PdfDownloadMainScreenController extends ChangeNotifier {
  File? doc;
  String? docText;
  List<List<String>>? parsedData;
  bool isLoading = true;
  List<BankOperationModel?>? bankOperations = [];

  Future<void> openPdfFromPath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      doc = files.first;
      final text = await doc!.readAsString();
      final data = fast_csv_ex.parse(text);
      final sortData =
          data.sublist(data.indexWhere((e) => e.first.contains('Date')) + 1);
      parsedData = sortData;
      isLoading = false;
      parseDateFromList();
      notifyListeners();
    }
  }

  void parseDateFromList() {
    if (parsedData != null) {
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

      final newDataa = newClassteredData[115];
      log(newDataa.toString());
      log(newDataa.length.toString());
      log(newDataa.first.toString());

      bankOperations = superNewClassteredData
          .map((e) => getFROMString(e))
          .toList()
        ..removeWhere((e) => e == null);
    }
  }

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
        isPlus: amount.contains('+'),
        purpose: client.toString());
  }

  Future<void> diposeData() async {
    isLoading = true;
    parsedData = null;
    bankOperations = null;
    doc = null;
    notifyListeners();
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
}


import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fast_csv/fast_csv_ex.dart' as fast_csv_ex;

class PdfDownloadMainScreenController extends ChangeNotifier {
  File? doc;
  String? docText;
  List<List<String>>? parsedData;
  bool isLoading = true;

  Future<void> openPdfFromPath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      doc = files.first;
      final text =  await doc!.readAsString();

      parsedData = fast_csv_ex.parse(text)  ;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> diposeData() async {
    isLoading = true;
    doc = null;
    notifyListeners();
  }

  // void parseTransactions() async {
  //   final RegExp transactionRegExp = RegExp(
  //     r'(\d{2}\.\d{2}\.\d{4})\s+([^\d]+)\s+([\d,]+)', // пример регулярного выражения для поиска даты, описания и суммы
  //     multiLine: true,
  //   );
  //   if (doc != null) {
  //     try {
  //       // List<int> bytes = await doc!.readAsBytes(); // Read file as binary data

  //       // If you are sure it's UTF-8 encoded text, decode it
  //       // String text = utf8.decode(bytes, allowMalformed: true);
  //       // final String text = await doc!.readAsString();

  //       final matches = transactionRegExp.allMatches(newText);
  //       for (final match in matches) {
  //         final date = match.group(1);
  //         final description = match.group(2);
  //         final amount = match.group(3);

  //         log(date.toString(), name: 'Date ');
  //         log(description.toString(), name: 'description ');
  //         log(amount.toString(), name: 'amount ');

  //         // Теперь можно сохранить или обработать эти данные
  //       }
  //     } on Exception catch (e) {
  //       // TODO
  //       log('Error on try read file from pdf ');
  //     }
  //   }
  // }
}

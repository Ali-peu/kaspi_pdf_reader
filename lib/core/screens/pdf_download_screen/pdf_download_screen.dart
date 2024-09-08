import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_screen/pdf_download_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_circular_progress_indicator.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_empty_data.dart';

import 'package:kaspi_pdf_reader/core/widgets/bank_operations_group_list_tile.dart';
import 'package:provider/provider.dart';

class PdfDownloadMainScreen extends StatefulWidget {
  const PdfDownloadMainScreen({super.key});

  @override
  State<PdfDownloadMainScreen> createState() => _PdfDownloadMainScreenState();
}

class _PdfDownloadMainScreenState extends State<PdfDownloadMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PdfDownloadController>(
        builder: (context, controller, child) {
      if (controller.bankOperations != null &&
          controller.bankOperations!.isEmpty) {
        return Center(
            child: AppEmptyData(
          iconWidget: const Icon(Icons.hourglass_empty),
          textWidget: TextButton(
              onPressed: () {
                controller.openPdfFromPath();
              },
              child: const Text('Данных нет,нажмите чтобы загрузить')),
        ));
      }
      return Column(children: [
        if (controller.isLoading)
          const AppCircularProgressIndicator()
        else
          Expanded(
            child: Column(
              children: [
                Text('Сумма расхода ${controller.getMinusSum()}'),
                Expanded(
                  child: ListView.builder(
                    key: controller.listViewKey,
                    itemCount: controller.groupedDataExpenditure.length,
                    itemBuilder: (context, index) {
                      final operation = controller.groupedDataExpenditure.values
                          .toList()[index];
                      final String name = controller
                          .groupedDataExpenditure.entries
                          .toList()[index]
                          .key;
                      double summ = 0.0;
                      for (var element in operation) {
                        summ += element.summ;
                      }
                      return GestureDetector(
                        onLongPress: () {
                          controller.setShowCheckBox();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: BankOperationsGroupListTile(
                                expansionTileTitle: name,
                                data: operation,
                                trailingText: 'Расходы',
                                trailingSumm: summ.toString(),
                              ),
                            ),
                            if (controller.showCheckBox)
                              Checkbox(
                                  value: controller.pickedGroupedDataExpenditure
                                      .containsKey(name),
                                  onChanged: (value) {
                                    if (value != null) {
                                      if (value) {
                                        controller.addPickedExpenditureValue(
                                            name, operation);
                                      } else {
                                        controller
                                            .removePickedExpenditureValue(name);
                                      }
                                    }
                                  })
                          ],
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          )
      ]);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_screen/pdf_download_controller.dart';
import 'package:provider/provider.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PdfDownloadController>(
        builder: (context, controller, child) {
      if (controller.showCheckBox) {
        return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: controller.clearPickedGroupedDataExpenditure,
                  icon: const Icon(Icons.backspace),
                  label: const Text('Отмена')),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (controller.pickedGroupedDataExpenditure.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Сперва выберите'),
                          duration: Duration(seconds: 1, milliseconds: 400)));
                    } else {
                      await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            final keyboardHeight =
                                MediaQuery.of(context).viewInsets.bottom;
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  12, 12, 12, keyboardHeight),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Выберите название категории'),
                                  TextField(
                                    controller: controller.controller,
                                    autofocus: true,
                                    onSubmitted: (value) {
                                      final data = controller
                                          .checkExpenditureNameInMap();
                                      if (data) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text('Уже есть')));
                                      } else {
                                        controller
                                            .createNewtypeOfGroupsForExpenditure();
                                      }
                                    },
                                    onEditingComplete: () {
                                      final data = controller
                                          .checkExpenditureNameInMap();
                                      if (data) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text('Уже есть'),
                                          behavior: SnackBarBehavior.floating,
                                          margin:
                                              EdgeInsets.only(bottom: 100.0),
                                        ));
                                      }
                                    },
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить')),
            ]);
      } else {
        return const SizedBox();
      }
    });
  }
}

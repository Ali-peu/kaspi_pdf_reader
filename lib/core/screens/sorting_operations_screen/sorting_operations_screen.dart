import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/operation_detail_screen/operation_detail_controller.dart';
import 'package:kaspi_pdf_reader/core/screens/operation_detail_screen/operation_detail_screen.dart';
import 'package:kaspi_pdf_reader/core/screens/sorting_operations_screen/sorting_operations_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_empty_data.dart';
import 'package:kaspi_pdf_reader/core/widgets/operation_group_widget.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase_example.dart';
import 'package:provider/provider.dart';

class SortingOperationsScreen extends StatefulWidget {
  const SortingOperationsScreen({super.key});

  @override
  State<SortingOperationsScreen> createState() =>
      _SortingOperationsScreenState();
}

class _SortingOperationsScreenState extends State<SortingOperationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SortingOperationsController>(
        builder: (context, value, child) {
      if (value.operations.isEmpty) {
        return const Center(
          child: AppEmptyData(
            iconWidget: Icon(Icons.hourglass_empty),
            textWidget: Text('Данных нет'),
          ),
        );
      }
      return Wrap(
        children: value.operations
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                  create: (context) =>
                                      OperationDetailController(
                                          bankOperationDriftModelRepository:
                                              BankOperationDriftModelRepository(
                                                  appDatabase: driftDatebase))
                                        ..loadBankOperations(e.id ?? 0),
                                  child: OperationDetailScreen(
                                      operationGroupsModel: e),
                                )));
                  },
                  child: OperationGroupWidget(
                    model: e,
                  ),
                ))
            .toList(),
      );
    });
  }
}

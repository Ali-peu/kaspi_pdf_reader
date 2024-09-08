import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/sorting_operations_screen/sorting_operations_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_empty_data.dart';
import 'package:kaspi_pdf_reader/core/widgets/operation_group_widget.dart';
import 'package:provider/provider.dart';

class SortingOperationsScreen extends StatelessWidget {
  const SortingOperationsScreen({super.key});

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
            .map((e) => OperationGroupWidget(
                  model: e,
                ))
            .toList(),
      );
    });
  }
}

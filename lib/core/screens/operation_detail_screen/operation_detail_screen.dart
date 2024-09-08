import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/operation_detail_screen/operation_detail_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_circular_progress_indicator.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_empty_data.dart';
import 'package:kaspi_pdf_reader/core/widgets/bank_operation_list_tile.dart';
import 'package:kaspi_pdf_reader/data/models/operation_groups_model/operation_groups_model.dart';
import 'package:provider/provider.dart';

class OperationDetailScreen extends StatelessWidget {
  final OperationGroupsModel operationGroupsModel;
  const OperationDetailScreen({super.key, required this.operationGroupsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(operationGroupsModel.name), centerTitle: true),
      body: Consumer<OperationDetailController>(
        builder: (context, controller, child) {
          if (controller.bankOperationModelList.isNotEmpty) {
            if (controller.isLoading) {
              return const AppCircularProgressIndicator();
            } else {
              return ListView(
                children: controller.bankOperationModelList
                    .map((e) => BankOperationListTile(bankOperationModel: e))
                    .toList(),
              );
            }
          } else {
            return const Center(
              child: AppEmptyData(
                iconWidget: Icon(Icons.hourglass_empty_sharp),
                textWidget: Text('Нет данных'),
              ),
            );
          }
        },
      ),
    );
  }
}

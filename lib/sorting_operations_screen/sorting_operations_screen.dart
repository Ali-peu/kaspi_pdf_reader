import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/operation_detail_screen/operation_detail_controller.dart';
import 'package:kaspi_pdf_reader/operation_detail_screen/operation_detail_screen.dart';
import 'package:kaspi_pdf_reader/pdf_download_screen/pdf_download_controller.dart';
import 'package:kaspi_pdf_reader/sorting_operations_screen/sorting_operations_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_empty_data.dart';
import 'package:kaspi_pdf_reader/core/widgets/operation_group_widget.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/core/data/models/operation_groups_model/operation_groups_model.dart';
import 'package:provider/provider.dart';

class SortingOperationsScreen extends StatefulWidget {
  const SortingOperationsScreen({super.key});

  @override
  State<SortingOperationsScreen> createState() =>
      _SortingOperationsScreenState();
}

class _SortingOperationsScreenState extends State<SortingOperationsScreen> {
  GestureDetector groupValue(BuildContext context, OperationGroupsModel e) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                      create: (context) => OperationDetailController(
                          bankOperationDriftModelRepository:
                              BankOperationDriftModelRepository(
                                  appDatabase: driftDatebase))
                        ..loadBankOperations(e.id ?? 0),
                      child: OperationDetailScreen(operationGroupsModel: e),
                    )));
      },
      child: OperationGroupWidget(
        model: e,
      ),
    );
  }

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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            Consumer<PdfDownloadController>(builder: (context, value, child) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Бюджет за октябрь'),
                              Text('Cash avaliable'),
                            ],
                          ),
                        ),
                        Text(
                            '${double.parse(value.getPlusSum()).toInt()} \u20B8',
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                  ),
                ),
              );
            }),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return groupValue(context, value.operations[index]);
                },
                childCount: value.operations.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
            ),
          ],
        ),
      );
    });
  }
}

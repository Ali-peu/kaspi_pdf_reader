import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/app/app_navigation.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_screen/pdf_download_controller.dart';
import 'package:kaspi_pdf_reader/core/screens/sorting_operations_screen/sorting_operations_controller.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/data/repo/bank_operation_repo.dart';
import 'package:kaspi_pdf_reader/data/repo/document_cleaner_repositoryes/scv_cleaner_repo.dart';
import 'package:kaspi_pdf_reader/data/repo/operation_groups_repo.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kaspi READER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<PdfDownloadController>(
                create: (_) => PdfDownloadController(
                    bankOperationRepo: BankOperationRepo(),
                    pdfCleanerRepo: SCVCleanerRepo())
                  ..getDataFromDrift()),
            ChangeNotifierProvider<SortingOperationsController>(
                create: (_) => SortingOperationsController(
                    operationGroupsRepo: OperationGroupsRepo(
                        bankOperationCategoryModelDriftModelRepository:
                            BankOperationCategoryModelDriftModelRepository(
                                appDatabase: driftDatebase)))),
          ],
          child: const AppNavigation(),
        ));
  }
}

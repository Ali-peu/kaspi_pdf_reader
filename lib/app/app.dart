import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaspi_pdf_reader/app/app_navigation.dart';
import 'package:kaspi_pdf_reader/core/data/database/database_repository/daily_expense_database_repository.dart';
import 'package:kaspi_pdf_reader/core/data/repo/daily_expense_repository.dart';
import 'package:kaspi_pdf_reader/pdf_download_screen/pdf_download_controller.dart';
import 'package:kaspi_pdf_reader/sorting_operations_screen/sorting_operations_controller.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase.dart';
import 'package:kaspi_pdf_reader/core/data/database/drift_datebase_example.dart';
import 'package:kaspi_pdf_reader/core/data/repo/bank_operation_repo.dart';
import 'package:kaspi_pdf_reader/core/data/repo/document_cleaner_repositoryes/scv_cleaner_repo.dart';
import 'package:kaspi_pdf_reader/core/data/repo/operation_groups_repo.dart';
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
        locale: const Locale('ru', 'RU'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru', 'RU')],
        home: MultiProvider(
          providers: [
            Provider<DailyExpenseRepository>(
              create: (context) => DailyExpenseRepository(
                  databaseRepository:
                      DailyExpenseDatabaseRepository(driftDatebase)),
            ),
            ChangeNotifierProvider<PdfDownloadController>(
                create: (_) => PdfDownloadController(
                    bankOperationRepo: BankOperationRepo(),
                    operationGroupsRepo: OperationGroupsRepo(
                        bankOperationCategoryModelDriftModelRepository:
                            BankOperationCategoryModelDriftModelRepository(
                                appDatabase: driftDatebase)),
                    pdfCleanerRepo: SCVCleanerRepo())
                  ..getDataFromDrift()),
            ChangeNotifierProvider<SortingOperationsController>(
                create: (_) => SortingOperationsController(
                    operationGroupsRepo: OperationGroupsRepo(
                        bankOperationCategoryModelDriftModelRepository:
                            BankOperationCategoryModelDriftModelRepository(
                                appDatabase: driftDatebase)))
                  ..getGroupsFromDrift()),
          ],
          child: const AppNavigation(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_main_screen_controller.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_primary_button.dart';
import 'package:provider/provider.dart';

class PdfDownloadMainScreen extends StatefulWidget {
  const PdfDownloadMainScreen({super.key});

  @override
  State<PdfDownloadMainScreen> createState() => _PdfDownloadMainScreenState();
}

class _PdfDownloadMainScreenState extends State<PdfDownloadMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Consumer<PdfDownloadMainScreenController>(
          builder: (context, controller, child) {
        return Column(children: [
          AppPrimaryButton(
            onPressed: controller.openPdfFromPath,
            buttonText: 'Загрузить пдф',
          ),
          AppPrimaryButton(
            onPressed: controller.diposeData,
            buttonText: 'Delete',
          ),
          // AppPrimaryButton(
          //   onPressed: controller.parseTransactions,
          //   buttonText: 'Parse',
          // ),
          // Consumer<PdfDownloadMainScreenController>(
          //     builder: (context, controller, child) {
          //   if (controller.isLoading) {
          //     return const SizedBox();
          //   } else {
          //     return Expanded(child: PdfTextLine.file(controller.doc!));
          //   }
          // }),
          if (controller.isLoading)
            const SizedBox()
          else
            Expanded(
              child: Column(
              
                children: [
                  Text('Сумма дохода ${controller.getPlusSum()}'),
                  Text('Сумма расхода ${controller.getMinusSum()}'),
              
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.bankOperations!.length,
                      itemBuilder: (context, index) {
                        final operation = controller.bankOperations![index];
                        return ColoredBox(
                          color: operation!.isPlus ? Colors.red : Colors.blue,
                          child: ListTile(
                            style: ListTileStyle.list,
                            title: Text(operation.typeOperation),
                            subtitle: Text((operation.summ).toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
        ]);
      }),
    );
  }
}

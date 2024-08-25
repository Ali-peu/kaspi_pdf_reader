import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_main_screen.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_main_screen_controller.dart';
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
        home: ChangeNotifierProvider(
            create: (context) => PdfDownloadMainScreenController(),
            child: const PdfDownloadMainScreen()));
  }
}

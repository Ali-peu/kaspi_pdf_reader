import 'package:flutter/material.dart';
import 'package:kaspi_pdf_reader/core/global_values/global_icons_map.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_screen/pdf_download_screen.dart';
import 'package:kaspi_pdf_reader/core/screens/pdf_download_screen/pdf_download_controller.dart';
import 'package:kaspi_pdf_reader/core/screens/sorting_operations_screen/sorting_operations_screen.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_primary_button.dart';
import 'package:provider/provider.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final body = <Widget>[
    const PdfDownloadMainScreen(),
    const SortingOperationsScreen()
  ];

  int currenPageIndex = 0;

  void changeCurrentIndex(int value) {
    setState(() {
      currenPageIndex = value;
    });
  }

  Future<void> onPressedAddData(
      PdfDownloadController controller, BuildContext context) async {
    if (controller.pickedGroupedDataExpenditure.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Сперва выберите'),
          duration: Duration(seconds: 1, milliseconds: 400)));
    } else {
      await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return StatefulBuilder(builder: (context, setStater) {
              return Builder(builder: (context) {
                final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                return Padding(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, keyboardHeight),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Выберите название категории'),
                        TextField(
                          controller: controller.controller,
                          autofocus: true,
                          onSubmitted: (value) {
                            // final data = controller.checkExpenditureNameInMap();
                            // if (data) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(content: Text('Уже есть')));
                            // } else {
                            //   controller.createNewtypeOfGroupsForExpenditure();
                            //   Navigator.pop(context);
                            // }
                          },
                          onEditingComplete: () {
                            // final data = controller.checkExpenditureNameInMap();
                            // if (data) {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(const SnackBar(
                            //     content: Text('Уже есть'),
                            //     behavior: SnackBarBehavior.floating,
                            //     margin: EdgeInsets.only(bottom: 100.0),
                            //   ));
                            // }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Wrap(
                            children: iconsMap.entries
                                .map((e) => ColoredBox(
                                      color:
                                          e.key == controller.pickedIconDataID
                                              ? Colors.grey.shade400
                                              : Colors.transparent,
                                      child: IconButton(
                                          onPressed: () {
                                            controller
                                                .setPickedIconDataID(e.key);
                                            setStater(() {});
                                          },
                                          icon: Icon(e.value)),
                                    ))
                                .toList(),
                          ),
                        ),
                        AppPrimaryButton(
                            buttonText: 'Сохранить',
                            onPressed: () {
                              controller.saveForCategoryType();
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                );
              });
            });
          });
    }
  }

  Widget getCurrentBody() {
    return body[currenPageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KASPI READER'),
        centerTitle: true,
      ),
      body: getCurrentBody(),
      floatingActionButton: Consumer<PdfDownloadController>(
          builder: (context, controller, child) {
        return IgnorePointer(
          ignoring: !controller.showCheckBox,
          child: Visibility(
            visible: controller.showCheckBox,
            child: FloatingActionButton(
              onPressed: () async {
                controller.clearTextField();
                await onPressedAddData(controller, context);
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
        ],
        onTap: changeCurrentIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:kaspi_pdf_reader/core/data/repo/daily_expense_repository.dart';
import 'package:kaspi_pdf_reader/core/global_values/global_icons_map.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_date_time_picker.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_primary_button.dart';
import 'package:kaspi_pdf_reader/core/widgets/app_text_filed.dart';
import 'package:provider/provider.dart';

class CreatePaymentScreen extends StatefulWidget {
  const CreatePaymentScreen({super.key});

  @override
  State<CreatePaymentScreen> createState() => _CreatePaymentScreenState();
}

class _CreatePaymentScreenState extends State<CreatePaymentScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    providerDailyExpenseRepository =
        Provider.of<DailyExpenseRepository>(context, listen: false);
  }

  late DailyExpenseRepository providerDailyExpenseRepository;

  final DateTimePickerInputController dateTimePickerInputController =
      DateTimePickerInputController();
  int pickedIconId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать запись'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: AppTextFiled(
                      controller: textEditingController, onPressed: (value) {})
                  .addPayment(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: Text('Выберите дату: ')),
                Expanded(
                  child: AppDateAndTimePicker(
                    availableHeight: 50,
                    availableWidth: 100,
                    dateFormat: DateFormat.ABBR_MONTH_DAY,
                    dateTimePickerInputController:
                        DateTimePickerInputController(),
                  ),
                ),
              ],
            ),
            AppTextFiled(
              onPressed: (value) {},
              controller: commentController,
              hintText: 'Коментарий(не обязательно)',
              hintTextStyle: const TextStyle(
                  fontSize: 12, textBaseline: TextBaseline.alphabetic),
            ),
            const Text('Иконка'),
            Wrap(
              spacing: 6,
              children: iconsMap.entries
                  .map((e) => ColoredBox(
                        color: e.key == pickedIconId
                            ? Colors.grey.shade400
                            : Colors.transparent,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                pickedIconId = e.key;
                              });
                            },
                            icon: Icon(e.value)),
                      ))
                  .toList(),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: AppPrimaryButton(
                    text: 'Создать',
                    buttonType: ButtonType.elevated,
                    onPressed: () {
                      final categoryName = iconsNameMap[pickedIconId] ?? '';

                      if (dateTimePickerInputController.pickedDateTime !=
                              null &&
                          double.tryParse(textEditingController.text)
                                  .runtimeType ==
                              double) {
                        providerDailyExpenseRepository.setDailyExpense(
                            comment: commentController.text,
                            amount: double.parse(textEditingController.text),
                            category: categoryName,
                            date:
                                dateTimePickerInputController.pickedDateTime!);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

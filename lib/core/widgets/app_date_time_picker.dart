import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';


import 'package:intl/intl.dart';

enum CustomInputType { onlyDate, onlyTime, both }

class AppDateAndTimePicker extends FormBuilderField<DateTime> {
  AppDateAndTimePicker({
    required DateTimePickerInputController dateTimePickerInputController,
    super.validator,
    super.autovalidateMode,
    DateTime? initialDate,
    bool Function(DateTime)? dateTimeValidationControlForPick,
    super.key,
    ValueChanged<DateTime?>? onChanged,
    CustomInputType inputType = CustomInputType.onlyDate,
    DateTime? lastDate,
    DateTime? firstDate,
    String? dateFormat,
    TextStyle? textStyle,
    String? name,
    TextStyle? errorStyle = const TextStyle(fontSize: 15, color: Colors.red),
    double? availableHeight,
    double? availableWidth,
    super.onSaved,
    bool use24hhourFormat = true,
    bool useRootNavigator = true,
  }) : super(
          name: name ?? 'customDatePicker',
          initialValue: dateTimePickerInputController.value ?? initialDate,
          builder: (state) {
            void onChangedHandler(DateTime? value) {
              state.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                DateTimePickerField(
                  dateTimeValidationControlForPick:
                      dateTimeValidationControlForPick ?? (value) => true,
                  controller: dateTimePickerInputController,
                  inputType: inputType,
                  onChanged: onChangedHandler,
                  side: state.hasError
                      ? const BorderSide(color: Colors.red, width: 2)
                      : BorderSide.none,
                  errorStyle: errorStyle,
                  initialDate: initialDate,
                  lastDate: lastDate,
                  firstDate: firstDate,
                  dateFormat: dateFormat,
                  textStyle: textStyle,
                  availableHeight: availableHeight,
                  availableWidth: availableWidth,
                  use24hhourFormat: use24hhourFormat,
                  useRootNavigator: useRootNavigator,
                ),
                if (state.hasError) ...[
                  Text(
                    state.errorText!,
                    style: errorStyle,
                  ),
                ],
              ],
            );
          },
        );
}

class DateTimePickerField extends StatefulWidget {
  const DateTimePickerField({
    required this.dateTimeValidationControlForPick,
    required this.controller,
    this.errorStyle,
    this.onChanged,
    this.availableHeight,
    this.availableWidth,
    this.side = BorderSide.none,
    this.inputType = CustomInputType.both,
    this.dateFormat = DateFormat.ABBR_MONTH_DAY, //  . MMMMd(localeCod) ,
    this.use24hhourFormat = false,
    this.lastDate,
    this.firstDate,
    this.initialDate,
    this.useRootNavigator = true,
    this.textStyle,
    super.key,
  });

  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final String? dateFormat;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;

  final bool useRootNavigator;

  final bool use24hhourFormat;

  final DateTimePickerInputController controller;
  final ValueChanged<DateTime?>? onChanged;
  final BorderSide side;
  final CustomInputType inputType;
  final bool Function(DateTime)? dateTimeValidationControlForPick;

  final double? availableHeight;
  final double? availableWidth;

  @override
  State<DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<DateTimePickerField> {
  late DateTimePickerInputController controller;

  @override
  void initState() {
    super.initState();

    if (mounted) {
      controller = widget.controller;
    }

    controller.addListener(() {
      widget.onChanged?.call(controller.value);
    });
  }

  @override
  void didUpdateWidget(covariant DateTimePickerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (oldWidget.controller != widget.controller) {
    //   controller = widget.controller ?? DateTimePickerInputController();
    //   controller.value = oldWidget.controller?.value;
    //   // widget.controller?.value = oldWidget.controller?.value;
    // }
  }

  @override
  void dispose() {
    // if (widget.controller != null) controller.dispose();
    super.dispose();
  }

  Future<void> showCupertinoDatePickerDialog() async {
    var localPickedDateTime = controller.value;
    final gettedDateTime = await showCupertinoDialog<DateTime>(
      context: context,
      builder: (context) {
        var cupertinoDatePickerMode = CupertinoDatePickerMode.date;
        var doenstShowErrorText = true;

        if (widget.inputType == CustomInputType.onlyDate) {
          cupertinoDatePickerMode = CupertinoDatePickerMode.date;
        } else if (widget.inputType == CustomInputType.onlyTime) {
          cupertinoDatePickerMode = CupertinoDatePickerMode.time;
        } else {
          cupertinoDatePickerMode = CupertinoDatePickerMode.dateAndTime;
        }
        return CupertinoAlertDialog(
          title: const Text('Выберите'),
          content: SizedBox(
            child: StatefulBuilder(builder: (context, stater) {
              return CupertinoTheme(
                data: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      fontSize: 18,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: CupertinoDatePicker(
                        minimumDate: widget.firstDate
                                ?.subtract(const Duration(minutes: 2)) ??
                            DateTime.now()
                                .subtract(const Duration(days: 365 * 3)),
                        maximumDate: (widget.lastDate ?? DateTime.now())
                            .add(const Duration(minutes: 1)),
                        mode: cupertinoDatePickerMode,
                        dateOrder: DatePickerDateOrder.dmy,
                        use24hFormat: widget.use24hhourFormat,
                        initialDateTime: controller.value ??
                            widget.initialDate ??
                            DateTime.now(),
                        onDateTimeChanged: (value) {
                          if (cupertinoDatePickerMode ==
                              CupertinoDatePickerMode.date) {
                            final pickedValue = value.copyWith(
                                hour: localPickedDateTime?.hour,
                                minute: localPickedDateTime?.minute);

                            doenstShowErrorText = widget
                                .dateTimeValidationControlForPick!(pickedValue);
                            stater(() {});

                            if (!doenstShowErrorText) {
                              localPickedDateTime = controller.value;
                              return;
                            }
                            localPickedDateTime = pickedValue;
                          } else {
                            doenstShowErrorText =
                                widget.dateTimeValidationControlForPick!(value);
                            stater(() {});
                            if (!doenstShowErrorText) {
                              localPickedDateTime = controller.value;
                              return;
                            }
                            localPickedDateTime = value;
                          }
                        },
                      ),
                    ),
                    if (!doenstShowErrorText)
                      Text(
                        'Ошибка',
                        style: widget.errorStyle,
                      )
                  ],
                ),
              );
            }),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
                child: const Text('Отмена'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                if (mounted) {
                  Navigator.pop(context, localPickedDateTime ?? DateTime.now());
                }
              },
            ),
          ],
        );
      },
    );
    if (gettedDateTime != null && mounted) {
      if (widget.inputType != CustomInputType.onlyDate) {
        controller.newDateTime(gettedDateTime);

        widget.controller.newDateTime(gettedDateTime);
      } else {
        controller.newDateTime(gettedDateTime);
      }
    }
  }

  Future<DateTime?> showDateTimePicker({
    required CustomInputType inputType,
    required bool useRootNavigator,
    required bool Function(DateTime)? dateTimeValidationControlForPick,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate.subtract(const Duration(days: 3));

    final lastDateInCalendar =
        lastDate ?? initialDate.add(const Duration(days: 5));

    if (inputType == CustomInputType.onlyTime && mounted) {
      final selectedTime = await showTimePicker(
        context: context,
        useRootNavigator: useRootNavigator,
        initialTime: TimeOfDay.fromDateTime(initialDate),
        initialEntryMode: TimePickerEntryMode.dialOnly,
      );
      if (selectedTime == null) {
        return null;
      }

      final returnDate = initialDate.copyWith(
          hour: selectedTime.hour, minute: selectedTime.minute);
      final value = dateTimeValidationControlForPick!(returnDate);
      if (!value) {
        return null;
      }

      return returnDate;
    } else {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDateInCalendar,
        useRootNavigator: useRootNavigator,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );

      if (selectedDate == null) return initialDate;

      final DateTime gettedDate;
      if (mounted && inputType == CustomInputType.onlyDate) {
        gettedDate = selectedDate.copyWith(
            hour: initialDate.hour, minute: initialDate.minute);

        final value = dateTimeValidationControlForPick!(gettedDate);

        if (!value) {
          return null;
        }
        return gettedDate;
      }

      if (mounted) {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate),
          initialEntryMode: TimePickerEntryMode.dialOnly,
        );
        if (selectedTime == null) {
          return null;
        }

        final pickedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        return pickedDateTime;
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () async {
        if (Platform.isAndroid) {
          final dateTime = await showDateTimePicker(
              initialDate: controller.value,
              inputType: widget.inputType,
              firstDate: widget.firstDate,
              useRootNavigator: widget.useRootNavigator,
              dateTimeValidationControlForPick:
                  widget.dateTimeValidationControlForPick ??
                      (value) {
                        return true;
                      },
              lastDate: widget.lastDate);

          if (dateTime == null) return;
          if (mounted) {
            controller.newDateTime(dateTime);
            widget.controller.newDateTime(dateTime);
          }
        }
        if (Platform.isIOS) {
          await showCupertinoDatePickerDialog();
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: widget.availableHeight,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color.fromRGBO(242, 242, 242, 1),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: widget.side,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (_, dateTime, child) => dateTime == null
              ? child ?? const SizedBox()
              : Center(
                  child: DateText(
                      inputType: widget.inputType,
                      pickedDateTime: dateTime,
                      dateFormat: widget.dateFormat,
                      textStyle: widget.textStyle)),
          child: Center(
              child: DateText(
                  inputType: widget.inputType,
                  pickedDateTime: widget.initialDate,
                  dateFormat: widget.dateFormat,
                  textStyle: widget.textStyle)),
        ),
      ),
    );
  }
}

class DateText extends StatelessWidget {
  const DateText(
      {required this.inputType,
      required this.pickedDateTime,
      required this.dateFormat,
      required this.textStyle,
      super.key});

  final CustomInputType inputType;
  final DateTime? pickedDateTime;
  final String? dateFormat;
  final TextStyle? textStyle;

  String formatDateTime(String? localeCode) {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final listToday = {'ru': 'Сегодня', 'en': 'Today', 'kk': 'Бүгін'};
    final listYesterday = {'ru': 'Вчера', 'en': 'Yesterday', 'kk': 'Кеше'};

    final onlyTimeFormat = DateFormat(DateFormat.HOUR24_MINUTE, localeCode);
    final onlyDateFormat =
        DateFormat(dateFormat ?? DateFormat.ABBR_MONTH_DAY, localeCode);

    String dateTodayFormatWithDate() {
      if (inputType == CustomInputType.onlyDate) {
        return listToday[localeCode] ?? 'Today';
      } else if (inputType == CustomInputType.onlyTime) {
        return onlyTimeFormat.format(pickedDateTime ?? DateTime.now());
      } else {
        return '${listToday[localeCode] ?? 'Today'}, ${onlyTimeFormat.format(pickedDateTime ?? DateTime.now())}';
      }
    }

    String dateYestardayFormatWithDate() {
      if (inputType == CustomInputType.onlyDate) {
        return listYesterday[localeCode] ?? 'Yesterday';
      } else if (inputType == CustomInputType.onlyTime) {
        return onlyTimeFormat.format(pickedDateTime ?? DateTime.now());
      } else {
        return '${listYesterday[localeCode] ?? 'Yesterday'}, ${onlyTimeFormat.format(pickedDateTime ?? DateTime.now())}';
      }
    }

    String dateFormatWithDate() {
      if (inputType == CustomInputType.onlyDate) {
        return onlyDateFormat.format(pickedDateTime ?? DateTime.now());
      } else if (inputType == CustomInputType.onlyTime) {
        return onlyTimeFormat.format(pickedDateTime ?? DateTime.now());
      } else {
        return '${onlyDateFormat.format(pickedDateTime ?? DateTime.now())}, ${onlyTimeFormat.format(pickedDateTime ?? DateTime.now())}';
      }
    }

    if (pickedDateTime != null) {
      if (isSameDay(pickedDateTime ?? DateTime.now(), today)) {
        return dateTodayFormatWithDate();
      } else if (isSameDay(pickedDateTime ?? DateTime.now(), yesterday)) {
        return dateYestardayFormatWithDate();
      } else {
        return dateFormatWithDate();
      }
    }
    return '';
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatDateTime('ru'), style: textStyle);
  }
}

class DateTimePickerInputController extends ValueNotifier<DateTime?> {
  DateTimePickerInputController({DateTime? initialValue}) : super(initialValue);

  DateTime? get pickedDateTime => value ?? super.value;

  void newDateTime(DateTime newValue) {
    if (newValue == value) return;

    super.value = newValue;
    value = newValue;

    notifyListeners();
  }
}

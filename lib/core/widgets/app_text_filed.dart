import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final String? helperText;
  final TextInputType? textInputType;
  final Widget? suffixWidget;
  final bool onlyRead;
  final void Function(String)? onPressed;
  final String? hintText;

  const AppTextFiled(
      {required this.onPressed,
      required this.controller,
      super.key,
      this.onlyRead = false,
      this.validator,
      this.textStyle,
      this.textInputType,
      this.hintTextStyle,
      this.contentPadding,
      this.helperText,
      this.suffixWidget,
      this.hintText});

  AppTextFiled addPayment() {
    return AppTextFiled(
      controller: controller,
      onPressed: onPressed,
      textStyle: textStyle,
      hintText: 'Введите сумму',
      textInputType: TextInputType.number,
      suffixWidget:
          Transform.flip(flipX: true, child: const Icon(Icons.attach_money)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Сумма не может быть ноль';
        }

        final paymentSumm = int.tryParse(value);
        if (paymentSumm == null || paymentSumm == 0) {
          return 'Сумма не может быть ноль';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: textStyle,
      onTapOutside: (event) {
        if (onPressed != null) {
          onPressed?.call(controller.text);
        }
      },
      onEditingComplete: () {
        if (onPressed != null) {
          onPressed?.call(controller.text);
        }
      },
      readOnly: onlyRead,
      keyboardType: textInputType ?? TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle,
        suffix: suffixWidget,
        contentPadding: contentPadding,
        helperText: helperText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

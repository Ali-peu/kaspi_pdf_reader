import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const AppPrimaryButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.buttonStyle,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: buttonStyle,
      child: Text(buttonText),
    );
  }
}

import 'package:flutter/material.dart';

class AppEmptyData extends StatelessWidget {
  final Widget? iconWidget;
  final Widget? textWidget;

  const AppEmptyData({super.key, this.iconWidget, this.textWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (iconWidget != null) iconWidget!,
        if (textWidget != null) textWidget!
      ],
    );
  }
}

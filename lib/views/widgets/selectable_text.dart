import 'package:flutter/material.dart';

class SelectableTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const SelectableTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: textStyle ?? Theme.of(context).textTheme.bodyText1,
      textAlign: textAlign,
    );
  }
}

import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  const CenteredText(
    this.text, {
    this.style,
    this.maxLines,
    this.overflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
          maxLines: maxLines,
          overflow: overflow,
        ),
      );
}

import 'package:flutter/material.dart';

// TODO: Add Comments

class LabelWidget extends StatelessWidget {
  final String label;
  final double width;
  final Color color;
  const LabelWidget({
    required this.label,
    required this.width,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
}

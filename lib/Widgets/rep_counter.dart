import 'package:flutter/material.dart';

class RepCounter extends StatelessWidget {
  final int value;
  final int totalValue;
  final double fontSize;

  const RepCounter({required this.value, required this.totalValue, required this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: Colors.white);
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      child: Column(children: <Widget>[
        Text(
          value.toString(),
          style: textStyle,
        ),
        Container(
          height: 5,
          width: 77,
          color: Colors.white,
        ),
        Text(
          totalValue.toString(),
          style: textStyle,
        ),
        const Text(
          'REPS',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
        )
      ]),
    );
  }
}

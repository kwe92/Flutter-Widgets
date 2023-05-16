import 'package:flutter/material.dart';

class RepCounter extends StatelessWidget {
  final int value;
  final int totalValue;
  final double fontSize;
  final double lineLength;
  final double lineWidth;
  final double slope;
  final bool isVertical;

  const RepCounter({
    required this.value,
    required this.totalValue,
    required this.fontSize,
    required this.lineLength,
    this.lineWidth = 5,
    this.slope = 12,
    this.isVertical = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const FontWeight fontWeight = FontWeight.w700;
    const Color white = Colors.white;
    const SizedBox gapw6 = SizedBox(width: 6);
    final TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: white,
    );

    final Widget numerator = Text(
      value.toString(),
      style: textStyle,
    );

    final Widget denominator = Text(
      totalValue.toString(),
      style: textStyle,
    );

    const Widget repsText = Text(
      'REPS',
      style: TextStyle(
        fontSize: 32,
        fontWeight: fontWeight,
        color: white,
      ),
    );

    final Widget customPaint = CustomPaint(
      painter: _LinePainter(
        width: lineWidth,
      ),
    );

    final horizontal = <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          numerator,
          gapw6,
          SizedBox(
            height: lineLength,
            width: slope,
            child: customPaint,
          ),
          gapw6,
          denominator,
        ],
      ),
      repsText
    ];

    final vertical = <Widget>[
      numerator,
      SizedBox(
        width: lineLength,
        child: customPaint,
      ),
      denominator,
      repsText
    ];

    return Column(
      children: isVertical ? vertical : horizontal,
    );
  }
}

class _LinePainter extends CustomPainter {
  final double width;
  const _LinePainter({required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(size.width, 0);
    final p2 = Offset(0, size.height);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) => false;
}

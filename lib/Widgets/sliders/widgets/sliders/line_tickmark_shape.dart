import 'package:flutter/material.dart';

class LineTickMarkShape extends SliderTickMarkShape {
  const LineTickMarkShape({
    this.tickMarkRadius,
  });
  final double? tickMarkRadius;

  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    required bool isEnabled,
  }) {
    assert(sliderTheme.trackHeight != null);

    return Size.fromRadius(tickMarkRadius ?? sliderTheme.trackHeight! / 4);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    required bool isEnabled,
  }) {
    assert(sliderTheme.disabledActiveTickMarkColor != null);
    assert(sliderTheme.disabledInactiveTickMarkColor != null);
    assert(sliderTheme.activeTickMarkColor != null);
    assert(sliderTheme.inactiveTickMarkColor != null);

    final Paint paint = Paint()..color = Colors.white;

    final double tickMarkRadius = getPreferredSize(
      isEnabled: isEnabled,
      sliderTheme: sliderTheme,
    ).width;

    if (tickMarkRadius > 0) {
      context.canvas.drawLine(Offset(center.dx, center.dy - tickMarkRadius), Offset(center.dx, center.dy + tickMarkRadius), paint);
    }
  }
}

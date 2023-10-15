import 'package:flutter/material.dart';

class CustomSliderTheme extends StatelessWidget {
  final Widget child;
  const CustomSliderTheme({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeColor = Color(0xff95c2ce);
    const Color inactiveColor = Color(0xffebdac8);
    const double thumbRadius = 12;
    const double tickMarkRadius = 8;

    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 12,
        thumbColor: activeColor,
        activeTrackColor: activeColor,
        activeTickMarkColor: activeColor,
        inactiveTrackColor: inactiveColor,
        inactiveTickMarkColor: inactiveColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
        tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: tickMarkRadius),
      ),
      child: child,
    );
  }
}

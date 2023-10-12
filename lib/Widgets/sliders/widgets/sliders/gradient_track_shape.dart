import 'package:flutter/material.dart';

class GradientTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  final bool swap;
  const GradientTrackShape({this.swap = false});

  final _gradientList = const [
    Color(0XFF15C859),
    Color(0XFF15C859),
    Color(0XFF7BC746),
    Color(0XFFFCC62E),
    Color(0XFFFC8D2A),
    Color(0XFFFC5226),
  ];
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }
    LinearGradient gradient = LinearGradient(
      colors: !swap ? _gradientList : _gradientList.reversed.toList(),
    );
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(begin: sliderTheme.disabledActiveTrackColor, end: sliderTheme.activeTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          trackRect.left - 15,
          trackRect.top,
          trackRect.right + 15,
          trackRect.bottom,
          topLeft: trackRadius,
          bottomLeft: trackRadius,
          topRight: trackRadius,
          bottomRight: trackRadius,
        ),
        activePaint);
  }
}

class CareNavigationColors {
  CareNavigationColors._();

  static const blue1 = Color(0xFF002254);
  static const blue2 = Color(0xFF0052B1);
  static const blue3 = Color(0xFF208CFF);
  static const blue4 = Color(0xFFE7F3FF);
  static const blue5 = Color(0xFFE7EDF6);
  static const blueNew6 = Color(0xFF002254);
  static const blueNew7 = Color(0xFF00B3FF);
  static const blueNew8 = Color(0xFF012D7A);

  static const green1 = Color(0xFF17C859);
  static const green2 = Color(0xFF4DEA8A);
  static const green3 = Color(0xFFCBEB78);
  static const green4 = Color(0xFFEEF89D);

  static const purple1 = Color(0xFF7917B2);
  static const purple2 = Color(0xFFBE39D0);
  static const purple3 = Color(0xFFF577F2);
  static const purple4 = Color(0xFFFEB9FA);

  static const scoreMeterRed = Color(0xFFB71C1C);
  static const scoreMeterOrange = Color(0xFFFF9800);
  static const scoreMeterGreen = Color(0xFF4CAF50);

  static const red1 = Color(0xFF820831);
  static const red2 = Color(0xFFFF5E41);
  static const red3 = Color(0xFFFF7960);
  static const red4 = Color(0xFFFDAEBA);

  static const yellow1 = Color(0xFFD85622);
  static const yellow2 = Color(0xFFFF793D);
  static const yellow3 = Color(0xFFFFB269);
  static const yellow4 = Color(0xFFFCEE36);

  static const neutral1 = Color(0xFF242A3D);
  static const neutral2 = Color(0xFFC3BEA5);
  static const neutral3 = Color(0xFFEBECE1);
  static const neutral4 = Color(0xFFF7F7F7);
  static const neutral5 = Color(0xFF1B1B1F);
  static const neutral6 = Color(0xFFD8D8D8);
  static const neutral7New = Color(0xFF979797);

  static const white1 = Color(0xE6FFFFFF); // 90% white

  static const setMarkerActive = Color(0xFF96F2BA);
  static const blueOverlay = Color(0xFF012D7A);
  static const gray1 = Color(0xFF979797);
  static const gray2 = Color(0x99242424);
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/custom_slider_theme.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_top.dart';

class SliderShapeWidget extends StatefulWidget {
  const SliderShapeWidget({super.key});

  @override
  State<SliderShapeWidget> createState() => _SliderShapeWidgetState();
}

class _SliderShapeWidgetState extends State<SliderShapeWidget> {
  double indexTop = 0;
  final double min = 0;
  final labels = const <String>['0', '18', '30', '50', '+'];

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: CustomSliderTheme(
            child: SliderTop(
              labels: labels,
              indexTop: indexTop,
              min: min,
              max: labels.length - 1,
              divisions: labels.length - 1,
              onChanged: (val) => setState(() => indexTop = val),
            ),
          ),
        ),
      );
}

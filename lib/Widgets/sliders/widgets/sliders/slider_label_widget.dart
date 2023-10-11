import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';

// TODO: add comments

class SliderLabelWidget extends StatefulWidget {
  const SliderLabelWidget({super.key});

  @override
  State<SliderLabelWidget> createState() => _SliderLabelWidgetState();
}

class _SliderLabelWidgetState extends State<SliderLabelWidget> {
  double value = 50;

  final double min = 0;

  final double max = 100;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        trackHeight: 16,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 16,
        ),
        activeTrackColor: SliderColors.aqua0,
        inactiveTrackColor: SliderColors.aqua0.withOpacity(0.50),
        thumbColor: SliderColors.aqua0,
        valueIndicatorColor: SliderColors.aqua0,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            buildSideLabel(min),
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: 20,
                label: value.round().toString(),
                onChanged: (value) => setState(
                  () => this.value = value,
                ),
              ),
            ),
            buildSideLabel(max),
          ],
        ),
      ),
    );
  }
}

Widget buildSideLabel(double value) {
  return Builder(
    builder: (context) => SizedBox(
      // set text fixed size
      width: 42,
      child: Text(
        value.round().toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

// Adding Labels to Sliders

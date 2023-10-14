import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_top.dart';

// TODO: review and add comments

class SliderLabelWidget extends StatefulWidget {
  const SliderLabelWidget({super.key});

  @override
  State<SliderLabelWidget> createState() => _SliderLabelWidgetState();
}

class _SliderLabelWidgetState extends State<SliderLabelWidget> {
  double value = 50;

  double indexTop = 0;

  final double min = 0;

  final double max = 100;

  final labels = const <String>['0', '18', '30', '50', '+'];

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SideLabelWidget(value: min),
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
                SideLabelWidget(value: max),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SliderTop(
            labels: labels,
            indexTop: indexTop,
            min: min,
            max: labels.length - 1,
            divisions: labels.length - 1,
            onChanged: (val) => setState(() => indexTop = val),
          ),
        ],
      ),
    );
  }
}

/// buildSideLabel: builds a side label for a slider
class SideLabelWidget extends StatelessWidget {
  final double value;
  const SideLabelWidget({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        // set text fixed size
        width: 42,
        child: Text(
          value.round().toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}


// Prefix and Sufix Slider Labels

//   - to add prefix and sufix labels you must wrap your Slider in a Row
//     then instantiate Widgets prefixing and sufixing your Slider to represent what values
//     you want to display to the user


// Labels Above Slider

//   - 
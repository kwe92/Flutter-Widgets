import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';
import 'package:flutter_widgets/Widgets/sliders/utils.dart';

// TODO: review and add comments
// TODO: break apart into diffrent components

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

  @override
  Widget build(BuildContext context) => SliderTheme(
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
            const SizedBox(height: 24),
            buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderTopLabel() {
    final labels = <String>['0', '18', '30', '50', '+'];

    const double min = 0;

    final double max = labels.length - 1;

    final divisions = labels.length - 1;

    return Builder(
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(labels, (index, label) {
                const selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(label: label, color: color, width: 30);
              }),
            ),
          ),
          Slider(
            value: indexTop.toDouble(),
            min: min,
            max: max,
            divisions: divisions,
            // label: labels[indexTop.toInt()],
            onChanged: (value) => setState(
              () => indexTop = value,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildLabel({
  required String label,
  required double width,
  required Color color,
}) =>
    SizedBox(
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

/// buildSideLabel: builds a side label for a slider
Widget buildSideLabel(double value) => Builder(
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

// Prefix and Sufix Slider Labels

//   - to add prefix and sufix labels you must wrap your Slider in a Row
//     then instantiate Widgets prefixing and sufixing your Slider to represent what values
//     you want to display to the user


// Labels Above Slider

//   - 
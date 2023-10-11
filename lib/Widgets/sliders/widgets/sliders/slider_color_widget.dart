import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';

// TODO: Add comments

class SliderColorWidget extends StatefulWidget {
  final double min;
  final double max;
  const SliderColorWidget({
    this.min = 0,
    this.max = 100,
    super.key,
  });

  @override
  State<SliderColorWidget> createState() => _SliderColorWidgetState();
}

class _SliderColorWidgetState extends State<SliderColorWidget> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        valueIndicatorColor: SliderColors.aqua0,
        thumbColor: SliderColors.tan0,
        activeTrackColor: SliderColors.tan0,
        inactiveTrackColor: SliderColors.tan0.withOpacity(0.50),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: value,
            min: widget.min,
            max: widget.max,
            divisions: 10,
            label: value.round().toString(),
            onChanged: (value) => setState(() => this.value = value),
          ),
          Slider(
            value: value,
            min: widget.min,
            max: widget.max,
            divisions: widget.max.toInt(),
            activeColor: SliderColors.aqua0,
            inactiveColor: SliderColors.aqua0.withOpacity(0.25),
            label: value.round().toString(),
            onChanged: (value) => setState(() => this.value = value),
          ),
        ],
      ),
    );
  }
}

// Slider

//   - divisions
//   - activeColor
//   - inactiveColor
//   - label

// SliderThemeData



import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//Range Slider Widget
//    - Add a slider widget
//    = min start: 0
//    - max end: 1
//    - Data types needed RangeValues, RangeLabels, RangeSlider

class WorknigWithRangeSlider extends StatefulWidget {
  const WorknigWithRangeSlider({super.key});

  @override
  State<WorknigWithRangeSlider> createState() => _WorknigWithRangeSliderState();
}

class _WorknigWithRangeSliderState extends State<WorknigWithRangeSlider> {
  RangeValues values = const RangeValues(0, 1);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Range Slider Widget'),
        ),
        body: Center(
          child: RangeSlider(
            values: values,
            divisions: 8,
            labels: labels,
            onChanged: (newValues) {
              setState(() {
                values = newValues;
              });
            },
          ),
        ),
      ),
    );
  }
}

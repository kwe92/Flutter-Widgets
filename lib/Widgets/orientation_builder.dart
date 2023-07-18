// TODO: Create a lesson on Orientation Builder

// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

class WorkingWithOrientationBuilder extends StatelessWidget {
  const WorkingWithOrientationBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

typedef WidgetGeneratorCallback = Widget Function(int index);

final WidgetGeneratorCallback generateColoredBox = (int index) => SizedBox(
      child: ColoredBox(
        color: Colors.purple,
        child: Text('box index: $index'),
      ),
    );

final List generatedWidgets = List.generate(10, generateColoredBox);

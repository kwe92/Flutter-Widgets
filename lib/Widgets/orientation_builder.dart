// TODO: Create a lesson on Orientation Builder

// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

class WorkingWithOrientationBuilder extends StatelessWidget {
  const WorkingWithOrientationBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wsorking With Orientation Builder'),
        ),
        body: const _CustomGridView(),
      ),
    );
  }
}

class _CustomGridView extends StatelessWidget {
  const _CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List generatedWidgets = List.generate(
      10,
      generateColoredBox,
    );
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        ...generatedWidgets,
      ],
    );
  }
}

typedef WidgetGeneratorCallback = Widget Function(
  int index,
);

final WidgetGeneratorCallback generateColoredBox = (int index) => Center(
      child: Container(
        height: 185,
        width: 185,
        child: ColoredBox(
          color: const Color.fromRGBO(188, 47, 230, 1),
          child: Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'box index: $index',
                  style: customTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );

const TextStyle customTextStyle = TextStyle(
  fontSize: 21,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

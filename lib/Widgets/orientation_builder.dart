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

final WidgetGeneratorCallback generateColoredBox = (int index) {
  const double size = 185;
  return Center(
    child: Container(
      height: size,
      width: size,
      child: _CoustomColoredBox(
        index: index,
      ),
    ),
  );
};

class _CustomDecoration extends BoxDecoration {
  final double size;
  const _CustomDecoration({required this.size});

  @override
  // TODO: implement borderRadius
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(size / 2);
}

class _CoustomColoredBox extends StatelessWidget {
  final int index;
  const _CoustomColoredBox({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
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
    );
  }
}

const TextStyle customTextStyle = TextStyle(
  fontSize: 21,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

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
          title: const FittedBox(child: Text('Working With Orientation Builder')),
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
    return OrientationBuilder(builder: (BuildContext context, Orientation orientation) {
      return GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: <Widget>[
          ...generatedWidgets,
        ],
      );
    });
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
      decoration: const _CustomDecoration(size: size),
      child: _CustomFittedBox(
        index: index,
      ),
    ),
  );
};

class _CustomDecoration extends BoxDecoration {
  final double size;
  const _CustomDecoration({required this.size});

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(size / 2);

  @override
  Color? get color => const Color.fromRGBO(243, 201, 214, 1);

  @override
  BoxBorder? get border => Border.all(
        width: 12,
        color: const Color.fromRGBO(158, 80, 143, 1),
      );
  // Color? get color => const Color.fromRGBO(188, 47, 230, 1); // darker purple
}

class _CustomFittedBox extends StatelessWidget {
  final int index;
  const _CustomFittedBox({required this.index, super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'box index: $index',
              style: customTextStyle,
            ),
          ),
        ),
      );
}

const TextStyle customTextStyle = TextStyle(
  fontSize: 21,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

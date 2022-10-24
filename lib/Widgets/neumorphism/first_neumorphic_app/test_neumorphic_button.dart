import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_widgets/Widgets/neumorphism/separation_encapsulation/conuter_app/review/counter_app/presentation/custom_neumorphic_button.dart';

Widget customNuemorphicCircularButton(
    {required child, double buttonSize = 80}) {
  return ConstrainedBox(
    constraints: BoxConstraints(
        minHeight: buttonSize,
        maxHeight: buttonSize,
        minWidth: buttonSize,
        maxWidth: buttonSize),
    child: NeumorphicButton(
      onPressed: () {},
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
          depth: 10,
          lightSource: LightSource.topLeft,
          shadowLightColor: const Color.fromRGBO(235, 234, 234, 1),
          shadowDarkColor: const Color.fromRGBO(48, 48, 48, 1),
          color: const Color.fromRGBO(53, 53, 53, 1)),
      child: Center(
        child: child,
      ),
    ),
  );
}

class TestNeumorphic extends StatelessWidget {
  const TestNeumorphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testing Neumorphic Widgets'),
        ),
        body: Center(child: customNuemorphicCircularButton(child: Text('8'))));
  }
}

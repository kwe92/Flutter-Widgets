import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MaterialAppNoScaffold extends StatelessWidget {
  const MaterialAppNoScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text(
          'I have no ancestor, so my text is red. I need a Scaffold to describe my textStyle'),
    );
  }
}

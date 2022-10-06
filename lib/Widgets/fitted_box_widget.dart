import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkingWithFittedBoxWidget extends StatefulWidget {
  const WorkingWithFittedBoxWidget({super.key});

  @override
  State<WorkingWithFittedBoxWidget> createState() =>
      _WorkingWithFittedBoxWidgetState();
}

class _WorkingWithFittedBoxWidgetState
    extends State<WorkingWithFittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working WIth FittedBox Widget'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 75,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(10),
            // FitteBox
            //  - A way of fitting widgets inside of a limited space
            child: const FittedBox(
              child: Text(
                'Flutter Mapp',
                style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

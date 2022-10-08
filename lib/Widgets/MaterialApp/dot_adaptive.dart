import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// .adaptive
//    - Creates an adaptive Widget that changes its UI based on the target platform
//    - IOS and MacOS or other

class WorkingWithDotAdaptive extends StatefulWidget {
  const WorkingWithDotAdaptive({super.key});

  @override
  State<WorkingWithDotAdaptive> createState() => _WorkingWithDotAdaptiveState();
}

class _WorkingWithDotAdaptiveState extends State<WorkingWithDotAdaptive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Working with .adaptive IOS')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider.adaptive(
            onChanged: (double newValue) {},
            value: 1,
          ),
          SwitchListTile.adaptive(
            value: true,
            onChanged: (bool newValue) {},
            title: const Text('Switch List Tile'),
          ),
          Switch.adaptive(value: true, onChanged: (bool newValue) {}),
          Icon(Icons.adaptive.share),
          const CircularProgressIndicator.adaptive(),
        ],
      )),
    );
  }
}

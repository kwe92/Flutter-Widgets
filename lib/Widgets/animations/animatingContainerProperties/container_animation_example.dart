import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // default properties that will be updated when the user taps a FloatingActionButton

  double _width = 50;

  double _height = 50;

  double _xAxis = 0;

  double _yAxis = 0;

  Color _backgroundColor = Colors.lightBlue;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _notifyWidget() => setState(() {});

  void _setRandomContainerProperties() {
    // pseudo-random number generator
    final random = Random();

    // generate random width and height
    _width = random.nextInt(300).toDouble();

    _height = random.nextInt(300).toDouble();

    // generate random position
    _xAxis = random.nextInt(2) > 0 ? random.nextInt(141).toDouble() : -random.nextInt(141).toDouble();

    _yAxis = random.nextInt(2) > 0 ? random.nextInt(291).toDouble() : -random.nextInt(291).toDouble();

    // generate random color
    _backgroundColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    // generate random border radius
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());

    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black.withOpacity(0.16),
          title: const Text("Working With AnimatedContainer"),
        ),
        body: Center(
          child: AnimatedContainer(
            // rigid motion: translation: shift an object within the cartesian plane
            transform: Matrix4.translationValues(_xAxis, _yAxis, 0),
            // animation transition time
            duration: const Duration(seconds: 1, milliseconds: 250),
            // adjust animation rate of change
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _backgroundColor,
              borderRadius: _borderRadius,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: _setRandomContainerProperties,
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}

// Implicit Animations

//   - a collection of widgets that manages animations

// AnimatedContainer - Implicit Animation

//   - automatically animate between old and new property values as they change

//   - null properties are not animated

//   - used for simple implicit animations

//   - more complex animation should use a subclass of AnimatedWidget such as: DecoratedBoxTransition or an AnimationController

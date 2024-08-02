import 'package:flutter/material.dart';

import 'package:flutter/physics.dart';

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({required this.child, super.key});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Alignment> _retractionAnimation;

  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _controller.addListener(_updateControllerWhenPointerReleased);
  }

  /// updates _dragAlignment when the animation produces a value, allowing the widget to retract to origin
  void _updateControllerWhenPointerReleased() {
    setState(
      () {
        _dragAlignment = _retractionAnimation.value;
      },
    );
  }

  void _convertUnitsOfPixelsDraggedToCoordinates(DragUpdateDetails details, Size size) {
    setState(() {
      final cordX = details.delta.dx / (size.width / 2);

      final cordY = details.delta.dy / (size.height / 2);

      _dragAlignment += Alignment(
        cordX,
        cordY,
      );
    });
  }

  /// the animation that acts as a retracting spring
  void _runRetractionAnimation(Offset pixelsPerSecond, Size size) {
    _retractionAnimation = _controller.drive(
      // interpolates between the point the widget was dragged to, to the point in the center where the widget started
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;

    final unitsPerSecondY = pixelsPerSecond.dy / size.height;

    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);

    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(
      spring,
      0,
      1,
      -unitVelocity,
    );

    _controller.animateWith(simulation);

    _controller.reset();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      // on user contact (pointer detection)
      onPanDown: (details) =>
          _controller.stop(), // using _controller.stop() allows you to catch and stop the widget as it is retracting to its starting origin

      // on user drag (pointer movement detection)
      onPanUpdate: (details) => _convertUnitsOfPixelsDraggedToCoordinates(details, size),

      // on user release (pointer release detection)
      onPanEnd: (details) => _runRetractionAnimation(details.velocity.pixelsPerSecond, size),
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


// extending SingleTickerProviderStateMixin

//   - extending SingleTickerProviderStateMixin allows a stateful widget to be the vsync of its AnimationController

// Why does an AnimationController need to be vsynced with its stateful widget?

// What is the vsync property used for on an AnimationController?


// Alignment Values

//   - coordinate values between [-1.0, -1.0] and [1.0, 1.0], where [0.0, 0.0] represents the center

//  - dividing the device Size by 2 converts units of "pixels dragged" to coordinates that Align uses

// DragEndDetails

//   - provides the velocity of the pointer when it stopped contacting the screen
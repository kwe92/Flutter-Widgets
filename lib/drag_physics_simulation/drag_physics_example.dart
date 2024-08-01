import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

// This recipe uses these steps:

//   1. Set up an animation controller - finished

//   2. Move the widget using gestures - finished

//   3. Animate the widget - finished

//   4. Calculate the velocity to simulate a springing motion - started

class DragPhysicsExample extends StatelessWidget {
  const DragPhysicsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.25),
        title: const Text("Drag Phsyics"),
      ),
      body: const DraggableCard(
        child: Icon(
          color: Colors.lightBlue,
          Icons.flutter_dash,
          size: 128,
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({required this.child, super.key});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Alignment> _animation;

  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _controller.addListener(() => setState(() {
          // updates _dragAlignment when the animation produces a value
          _dragAlignment = _animation.value;
        }));
  }

  /// dividing the device Size by 2 converts units of "pixels dragged" to coordinates that Align uses.
  void _convertUnitsOfPixelsDraggedToCoordinates(DragUpdateDetails details, Size size) {
    setState(() {
      //?? why use the augmented assignment operation here ? | try the example with assignment and see what happens
      _dragAlignment += Alignment(
        details.delta.dx / (size.width / 2),
        details.delta.dy / (size.height / 2),
      );
    });
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      // interpolates between the point the waidget was dragged to, to the point in the center where the widget started
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
    //?? why use var here instead of final? | Maybe because the MediaQuery extends InheritedWidget?
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      // on user contact (pointer detection)
      onPanDown: (details) => _controller.stop(),

      // on user drag (pointer movement detection)
      onPanUpdate: (details) => _convertUnitsOfPixelsDraggedToCoordinates(details, size),

      // on user release (pointer release detection)
      onPanEnd: (details) => _runAnimation(details.velocity.pixelsPerSecond, size),
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

// TODO: AppBarWithDropShadow needs to be a PreferredSizeWidget
// AppBar with drop shadow underneath.

// class AppBarWithDropShadow extends StatelessWidget {
//   final Widget title;

//   final Color? shadowColor;

//   final double? spreadRadius;

//   final Color? backgroundColor;

//   const AppBarWithDropShadow({
//     required this.title,
//     this.shadowColor,
//     this.spreadRadius = 2,
//     this.backgroundColor = Colors.white,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: spreadRadius,
//       backgroundColor: backgroundColor,
//       surfaceTintColor: Colors.transparent,
//       shadowColor: shadowColor ?? Colors.black.withOpacity(0.25),
//       title: title,
//     );
//   }
// }

// extending SingleTickerProviderStateMixin

//   - extending SingleTickerProviderStateMixin allows a stateful widget to be the vsync of its AnimationController

// Why does an AnimationController need to be vsynced with its stateful widget?

// What is the vsync property used for on an AnimationController?


// Alignment Values

//   - coordinate values between [-1.0, -1.0] and [1.0, 1.0], where [0.0, 0.0] represents the center

// DragEndDetails

//   - provides the velocity of the pointer when it stopped contacting the screen
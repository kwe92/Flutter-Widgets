import 'package:flutter/material.dart';

class AnimationDeepDive extends StatefulWidget {
  const AnimationDeepDive({super.key});

  @override
  State<AnimationDeepDive> createState() => _AnimationDeepDiveState();
}

class _AnimationDeepDiveState extends State<AnimationDeepDive> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var mutableState = 0; // state to be updated each frame

  var timesUpdated = 0;

  final duration = 2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // pass subclass of TickerProvider to AnimationController
      duration: Duration(seconds: duration), // set animation duration
    );

    _controller.addListener(_updateState); // call _updateState every time the value of the AnimationController changes

    _controller.forward(); // start the animation
  }

  void _updateState() {
    mutableState = (_controller.value * 299792458).round();
    timesUpdated += 1;
    _notifyWidget();
  }

  void _notifyWidget() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$mutableState m/s',
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'times updated in $duration second: $timesUpdated',
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
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

// Animations in Flutter

//   - quick succession of changing the state of widgets 60 to 120 times per second (FPS - Frames Per Second)

//   - seems like the default updates per second is around 60 frames per second for simple animations
//     seems to be a range of values instead of one constant value (sometimes 60, sometimes 58 etc)

//   - fast consecutive rebuilds of an animation

//   - you can do whatever you want on each frame

// Ticker

//   - typically wont be used directly and instead you will use SingleTickerProviderStateMixin
//     which takes care of managing the life cycle of a Ticker Object

//   - an object that takes a callback and calls the callback function every frame
 
//   - must be disposed of


// Easier Ways to Animate

//   - the above example is unnecessarily complex and can be achieved with a TweenAnimationBuilder with
//     fewer lines of code
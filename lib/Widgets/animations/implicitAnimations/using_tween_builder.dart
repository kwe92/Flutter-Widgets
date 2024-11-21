import 'dart:math';

import 'package:flutter/material.dart';

class UsingTweenBuilder extends StatelessWidget {
  const UsingTweenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0.0, end: 2 * pi),
          builder: (_, angle, __) {
            return Transform.scale(
              // scale: (angle + 1) / angle,
              scale: (angle + 0.25) / angle - 0.25,

              child: Transform.rotate(
                angle: angle,
                child: Image.asset('assets/eden.webp'),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Code Based Animations: Implicit Animations

//   - animations that do not require an explicit AnimationController

//   - typically go in one direction interpolating from a starting value to an end value and stops

//   - let the Flutter framework animate for you under the hood

//   - used for simple animations that are finite in their duration and discontinuous

//   - there are two categories of Code Based Implicit Animations:

//       - Built-in: using widgets prefixed with the word Animated

//       - Custom: animations created using TweenAnimationBuilder

// TweenAnimationBuilder

//   - a way to construct custom implict animations if there is no
//     AnimatedFoo widget built-in i.e. AnimatedContainer or AnimatedOpacity etc

//   - does not require setState but can be combined with a Stateful widget to dynamically
//     change a Tween end parameter

//   - using static final Tween objects and child arguments can increase performance
//     when dealing with complex  or expensive widgets and animations

// Ways to Create Implicit Animations

//   - AnimatedFoo widgets (built-in)

//   - TweenAnimationBuilder (custom)


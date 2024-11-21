import 'dart:math';

import 'package:flutter/material.dart';

class UsingTweenBuilder2 extends StatelessWidget {
  const UsingTweenBuilder2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Implicit Animations',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0.0, end: 2 * pi),
              builder: (_, angle, __) {
                return Transform.rotate(
                  angle: angle,
                  child: TweenAnimationBuilder(
                    duration: const Duration(seconds: 2, milliseconds: 500),
                    tween: ColorTween(begin: Colors.white, end: Colors.orange),
                    builder: (_, color, __) {
                      return TweenAnimationBuilder(
                          duration: const Duration(seconds: 2, milliseconds: 500),
                          tween: Tween<double>(begin: 1.0, end: 2.0),
                          builder: (_, scale, __) {
                            return ColorFiltered(
                              colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                              child: Transform.scale(
                                scale: scale,
                                child: Image.asset(
                                  'assets/sun.jpeg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          });
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}

// Nesting (Composing) TweenAnimationBuilder's

//   - you can next TweenAnimationBuilder's with different types of values to create a complex animation

// Types of Tween Widgets

//   - Tween

//   - ColorTween

// Tween

//   - immutable range of values you wish to animate between

//   - if you are always going to animate between the same set of values
//     a Tween should be a static final variable as to not instantiate a new Tween Object
//     every time you rebuild

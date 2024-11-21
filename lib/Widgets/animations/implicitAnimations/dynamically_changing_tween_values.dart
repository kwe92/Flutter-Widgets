import 'dart:math';

import 'package:flutter/material.dart';

class DynamicallyChangingTweenValues extends StatefulWidget {
  const DynamicallyChangingTweenValues({super.key});

  @override
  State<DynamicallyChangingTweenValues> createState() => _DynamicallyChangingTweenValuesState();
}

class _DynamicallyChangingTweenValuesState extends State<DynamicallyChangingTweenValues> {
  var _sliderValue = 0.0;

  Color _newColor = Colors.white;

  void _notifyWidget() => setState(() {});

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
      body: Column(
        children: [
          Flexible(
            child: Center(
              child: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: TweenAnimationBuilder(
                  duration: const Duration(seconds: 2),
                  tween: Tween<double>(begin: 0.0, end: 2 * pi),
                  builder: (_, angle, child) {
                    return Transform.rotate(
                      angle: angle,
                      child: TweenAnimationBuilder(
                        duration: const Duration(seconds: 2, milliseconds: 500),
                        tween: ColorTween(begin: Colors.white, end: _newColor),
                        builder: (_, color, __) {
                          return TweenAnimationBuilder(
                              duration: const Duration(seconds: 2, milliseconds: 500),
                              tween: Tween<double>(begin: 1.0, end: 2.0),
                              builder: (_, scale, __) {
                                return ColorFiltered(
                                  colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                                  child: Transform.scale(
                                    scale: scale,
                                    child: child,
                                  ),
                                );
                              });
                        },
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/sun.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Slider.adaptive(
              value: _sliderValue,
              onChanged: (value) {
                _sliderValue = value;
                _newColor = Color.lerp(Colors.white, Colors.red, _sliderValue)!;
                _notifyWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}

// Dynamically Changing Tween Values

//   - can be done using a Stateful Widget

// TweenAnimationBuilder Interpolation

//   - should only dynamically change the end value

//   - always moves from the current value to the new end value

//   - in the above example as the slider moves the image color is changed
//     relative to its previous color rather than always animating with the start color of white

//   - will always smoothly animate between its current value and the new end value

//   - dynamically changing the start of your tween will have no effect

// Curve

//   - controls how the values will be interpolated

//   - controls the rate of change over time when animating between two values

// TweenAnimationBuilder child Parameter

//   - setting the child parameter can be a potential performance optimization

//   - a widget passed in as a child argument will not be reconstructed frame to frame

//   - build a non-constant widget ahead of time to help with performance

// TweenAnimationBuilder onEnd Parameter

//   - called once the animation is complete

//   - can be used to reverse an tween animation when combined 
//     with a stateful widget abd setState
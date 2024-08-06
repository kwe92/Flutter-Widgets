import 'package:flutter/material.dart';

typedef TransitionsBuilderCallback = Widget Function(BuildContext, Animation<double>, Animation<double>, Widget);

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  CustomPageRouteBuilder._internal({
    required super.pageBuilder,
    required super.transitionsBuilder,
  });

  factory CustomPageRouteBuilder(Widget view, {isVerticalTranslation = true}) => CustomPageRouteBuilder._internal(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: _defaultTransitionsBuilder(isVerticalTranslation),
      );

  /// a higher order function returning a [TransitionsBuilderCallback]
  static TransitionsBuilderCallback _defaultTransitionsBuilder(bool isVerticalTranslation) =>
      (context, animation, secondaryAnimation, child) {
        // where the animation starts on screen
        final begin = isVerticalTranslation ? const Offset(0, 1) : const Offset(1, 0);

        // where the animation ends on screen
        const end = Offset.zero;

        // how the animation enters and exits into view
        const curve = Curves.easeIn;

        final curveBetween = CurveTween(curve: curve);

        final animateBetween = Tween(
          begin: begin,
          end: end,
        ).chain(curveBetween); // chain, combines tweens

        final Animation<Offset> offsetAnimation = animation.drive<Offset>(animateBetween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      };
}

// TODO: refactor comments

//  PageRouteBuilder

//    - allows the user to customize route transition animations

//    - NOTE: Route is synonymous to: Page, Screen, or View

// Curve Class

//   - A collection of common animation curves that can alter how a Route enters into view
//    adjusting the rate of the animation over time

//   - i.e. does the Route (View / Screen) start fast and end slow (Curves.easeIn) or does it bounce into view (Curves.bounceIn)


// Offset.zero

//   - equivalent to OffSet(0,0) and represents the origin of 2-d Real Cartesian Coordinate Space (two dimensional grid system)

//   - the y-axis is inverted relative to the mathematical 2-D Cartesian Plane and increases in the downward direction


// SlideTransition

//   - creates a fractional translation (slide) on the Cartesian Plane
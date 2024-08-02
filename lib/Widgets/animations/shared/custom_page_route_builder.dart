import 'package:flutter/material.dart';

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  CustomPageRouteBuilder._internal({
    required super.pageBuilder,
    required super.transitionsBuilder,
  });

  factory CustomPageRouteBuilder(Widget view, {isVerticalTranslation = true}) => CustomPageRouteBuilder._internal(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: _defaultTransitionsBuilder(isVerticalTranslation),
      );

  static _defaultTransitionsBuilder(bool isVerticalTranslation) => (context, animation, secondaryAnimation, child) {
        final begin = isVerticalTranslation ? const Offset(0, 1) : const Offset(1, 0);
        const end = Offset.zero; // equivalent to  OffSet(0,0) and represents the origin of a coordinate space
        const cubicCurveType = Curves.easeIn;

        final curveBetween = CurveTween(curve: cubicCurveType);

        final animateBetween = Tween(
          begin: begin,
          end: end,
        ).chain(curveBetween);

        final Animation<Offset> offsetAnimation = animation.drive<Offset>(animateBetween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      };
}

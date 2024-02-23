import 'package:flutter/material.dart';

class CustomPageRouteBuilder<T> extends PageRouteBuilder<T> {
  factory CustomPageRouteBuilder(Widget view, {isVerticalTranslation = true}) {
    return CustomPageRouteBuilder._internal(
      pageBuilder: (context, animation, secondaryAnimation) {
        return view;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
      },
    );
  }

  CustomPageRouteBuilder._internal({
    required super.pageBuilder,
    required super.transitionsBuilder,
  });
}

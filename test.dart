import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

mixin CustomBoxDecoration implements BoxDecoration {
  // TODO: implement backgroundBlendMode
  BlendMode? get backgroundBlendMode => throw UnimplementedError();

  @override
  // TODO: implement border
  BoxBorder? get border => throw UnimplementedError();

  @override
  // TODO: implement borderRadius
  BorderRadiusGeometry? get borderRadius => throw UnimplementedError();

  @override
  // TODO: implement boxShadow
  List<BoxShadow>? get boxShadow => throw UnimplementedError();

  @override
  // TODO: implement color
  Color? get color => throw UnimplementedError();

  @override
  BoxDecoration copyWith(
      {Color? color,
      DecorationImage? image,
      BoxBorder? border,
      BorderRadiusGeometry? borderRadius,
      List<BoxShadow>? boxShadow,
      Gradient? gradient,
      BlendMode? backgroundBlendMode,
      BoxShape? shape}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    throw UnimplementedError();
  }

  @override
  bool debugAssertIsValid() {
    // TODO: implement debugAssertIsValid
    throw UnimplementedError();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    // TODO: implement getClipPath
    throw UnimplementedError();
  }

  @override
  // TODO: implement gradient
  Gradient? get gradient => throw UnimplementedError();

  @override
  bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
    // TODO: implement hitTest
    throw UnimplementedError();
  }

  @override
  // TODO: implement image
  DecorationImage? get image => throw UnimplementedError();

  @override
  // TODO: implement isComplex
  bool get isComplex => throw UnimplementedError();

  @override
  BoxDecoration? lerpFrom(Decoration? a, double t) {
    // TODO: implement lerpFrom
    throw UnimplementedError();
  }

  @override
  BoxDecoration? lerpTo(Decoration? b, double t) {
    // TODO: implement lerpTo
    throw UnimplementedError();
  }

  @override
  // TODO: implement padding
  EdgeInsetsGeometry get padding => throw UnimplementedError();

  @override
  BoxDecoration scale(double factor) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  @override
  // TODO: implement shape
  BoxShape get shape => throw UnimplementedError();

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringShort() {
    // TODO: implement toStringShort
    throw UnimplementedError();
  }
}

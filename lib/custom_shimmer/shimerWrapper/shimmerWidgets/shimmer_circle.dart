import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmer_wrapper.dart';

class ShimmerCircle extends StatelessWidget {
  final double size;

  final Color? baseColor;

  final Color? highlightColor;

  final HighlightTilt highlightTilt;

  const ShimmerCircle({
    this.size = 60,
    this.baseColor,
    this.highlightColor,
    this.highlightTilt = HighlightTilt.none,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (baseColor != null && highlightColor != null) {
      return ShimmerWrapper(
        highlightTilt: highlightTilt,
        baseColor: baseColor!,
        highlightColor: highlightColor!,
        child: _getPlaceHolder(),
      );
    }

    if (baseColor != null) {
      return ShimmerWrapper(
        highlightTilt: highlightTilt,
        baseColor: baseColor!,
        child: _getPlaceHolder(),
      );
    }

    if (highlightColor != null) {
      return ShimmerWrapper(
        highlightTilt: highlightTilt,
        highlightColor: highlightColor!,
        child: _getPlaceHolder(),
      );
    }

    return ShimmerWrapper(
      highlightTilt: highlightTilt,
      child: _getPlaceHolder(),
    );
  }

  Widget _getPlaceHolder() => Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      );
}

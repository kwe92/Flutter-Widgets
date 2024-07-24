import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmer_wrapper.dart';

class ShimmerText extends StatelessWidget {
  final double width;

  final double height;

  final double borderRadius;

  final Color? baseColor;

  final Color? highlightColor;

  final HighlightTilt highlightTilt;

  const ShimmerText({
    this.width = double.infinity,
    this.height = 24,
    this.borderRadius = 16,
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
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      );
}

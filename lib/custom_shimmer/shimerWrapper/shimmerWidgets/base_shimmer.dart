import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmer_wrapper.dart';

abstract class BaseShimmer extends StatelessWidget {
  final Color? baseColor;

  final Color? highlightColor;

  final HighlightTilt highlightTilt;

  const BaseShimmer({
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
        child: getPlaceHolder(),
      );
    }

    if (baseColor != null) {
      return ShimmerWrapper(
        highlightTilt: highlightTilt,
        baseColor: baseColor!,
        child: getPlaceHolder(),
      );
    }

    if (highlightColor != null) {
      return ShimmerWrapper(
        highlightTilt: highlightTilt,
        highlightColor: highlightColor!,
        child: getPlaceHolder(),
      );
    }

    return ShimmerWrapper(
      highlightTilt: highlightTilt,
      child: getPlaceHolder(),
    );
  }

  Widget getPlaceHolder();
}

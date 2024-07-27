import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/base_shimmer.dart';

class ShimmerText extends BaseShimmer {
  final double width;

  final double height;

  final double borderRadius;

  const ShimmerText({
    this.width = double.infinity,
    this.height = 24,
    this.borderRadius = 16,
    super.baseColor,
    super.highlightColor,
    super.highlightTilt,
    super.key,
  });

  @override
  Widget getPlaceHolder() => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      );
}

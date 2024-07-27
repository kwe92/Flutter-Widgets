import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/base_shimmer.dart';

class ShimmerContainer extends BaseShimmer {
  final double width;

  final double height;

  final double borderRadius;

  const ShimmerContainer({
    required this.width,
    required this.height,
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

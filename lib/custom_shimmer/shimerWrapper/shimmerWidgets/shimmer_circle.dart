import 'package:flutter/material.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/base_shimmer.dart';

class ShimmerCircle extends BaseShimmer {
  final double size;

  const ShimmerCircle({
    this.size = 60,
    super.baseColor,
    super.highlightColor,
    super.highlightTilt,
    super.key,
  });

  @override
  Widget getPlaceHolder() => Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      );
}

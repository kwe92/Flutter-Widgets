import 'package:flutter/material.dart';

enum HighlightTilt {
  none,
  left,
  right,
}

class ShimmerWrapper extends StatefulWidget {
  final Widget child;

  final LinearGradient linearGradient;

  final Color baseColor;

  final Color highlightColor;

  final HighlightTilt highlightTilt;

  ShimmerWrapper({
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.highlightTilt = HighlightTilt.none,
    super.key,
  }) : linearGradient = LinearGradient(
          colors: [
            baseColor,
            highlightColor,
            baseColor,
          ],
          stops: const [
            0.1,
            0.3,
            0.4,
          ],
          begin: _getTiltAlignmentBegin(highlightTilt),
          end: _getTiltAlignmentEnd(highlightTilt),
          tileMode: TileMode.clamp,
        );

  @override
  State<ShimmerWrapper> createState() => _ShimmerWrapperState();
}

class _ShimmerWrapperState extends State<ShimmerWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  void _refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));

    // notify wideget of change in animation controller value
    _shimmerController.addListener(_refresh);
  }

  @override
  Widget build(BuildContext context) {
    return _CommonShaderMask(
      gradient: gradient,
      child: widget.child,
    );
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        tileMode: widget.linearGradient.tileMode,
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );

  @override
  void dispose() {
    _shimmerController.dispose();
    _shimmerController.removeListener(_refresh);
    super.dispose();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class _CommonShaderMask extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  const _CommonShaderMask({required this.child, required this.gradient, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return gradient.createShader(bounds);
        },
        child: child);
  }
}

Alignment _getTiltAlignmentBegin(HighlightTilt tilt) {
  return switch (tilt) {
    HighlightTilt.none => Alignment.centerLeft,
    HighlightTilt.left => Alignment.topRight,
    HighlightTilt.right => Alignment.bottomRight,
  };
}

Alignment _getTiltAlignmentEnd(HighlightTilt tilt) {
  return switch (tilt) {
    HighlightTilt.none => Alignment.centerRight,
    HighlightTilt.left => Alignment.bottomLeft,
    HighlightTilt.right => Alignment.topLeft,
  };
}

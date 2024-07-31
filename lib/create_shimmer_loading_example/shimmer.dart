import 'package:flutter/material.dart';

class Shimmer extends StatefulWidget {
  final LinearGradient linearGradient;
  final Widget? child;

  const Shimmer({
    required this.linearGradient,
    this.child,
    super.key,
  });

  /// Allows decendent widgets to access the state object of this stateful widget.
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }

  Gradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Listenable get shimmerController => _shimmerController;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}


// context.findAncestorStateOfType<T>()

//   - Returns the State object of the nearest ancestor StatefulWidget widget that is an instance of the given type T.  <----- Word For Word

//   - Calling this method is relatively expensive (O(N) in the depth of the tree). <----- Word For Word
//     Only call this method if the distance from this widget to the desired ancestor is known to be small and bounded. <----- Word For Word
import 'package:flutter/material.dart';

class ShimmerProvider extends StatefulWidget {
  final Color baseColor;
  final Color highlightColor;
  final Duration animationDuration;
  final LinearGradient linearGradient;
  final Widget? child;

  ShimmerProvider({
    this.baseColor = const Color(0xFFEBEBF4),
    this.highlightColor = const Color(0xFFF4F4F4),
    this.animationDuration = const Duration(milliseconds: 1000),
    this.child,
    super.key,
  }) : linearGradient = LinearGradient(
          colors: [
            baseColor,
            highlightColor,
            baseColor,
          ],
          stops: const [
            // Used to thin or thicken highlightColor
            0.1,
            0.1,
            0.2,
          ],
          begin: const Alignment(-1.0, -0.3),
          end: const Alignment(1.0, 0.3),
          tileMode: TileMode.clamp,
        );

  /// Allows decendent widgets to access the state object of this stateful widget.
  static ShimmerProviderState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerProviderState>();
  }

  @override
  ShimmerProviderState createState() => ShimmerProviderState();
}

class ShimmerProviderState extends State<ShimmerProvider> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)..repeat(min: -0.5, max: 1.5, period: widget.animationDuration);
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
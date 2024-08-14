import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/bubble_painter.dart';

/// Responsible for drawing the bubble gradient.
@immutable
class BubbleBackground extends StatelessWidget {
  final List<Color> colors;

  final Widget? child;

  const BubbleBackground({
    required this.colors,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(
        ancestorScrollable: Scrollable.of(context),
        bubbleBackgroundContext: context,
        colors: colors,
      ),
      child: child,
    );
  }
}

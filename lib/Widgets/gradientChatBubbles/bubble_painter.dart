import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// Responsible for painting the BubbleBackground widget depending on its location within the ancestor [Scrollable].
class BubblePainter extends CustomPainter {
  final List<Color> colors;

  final ScrollableState ancestorScrollable;

  final BuildContext bubbleBackgroundContext;

  const BubblePainter({
    required this.ancestorScrollable,
    required this.bubbleBackgroundContext,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // ancestor Scrollable
    final scrollableBox = ancestorScrollable.context.findRenderObject() as RenderBox;

    // used to determine gradient direction
    final scrollableRect = Offset.zero & scrollableBox.size;

    // the message bubble
    final bubbleBox = bubbleBackgroundContext.findRenderObject() as RenderBox;

    final origin = bubbleBox.localToGlobal(Offset.zero, ancestor: scrollableBox);

    final paint = Paint()
      ..shader = ui.Gradient.linear(
        scrollableRect.topCenter,
        scrollableRect.bottomCenter,
        colors,
        [0.0, 1.0], // color stops
        TileMode.clamp,
        // Transform.translate(offset: -origin).transform.storage, //? does the same thing as the code bellow but less efficiently, due to the creation of a Transform widget
        Matrix4.translationValues(-origin.dx, -origin.dy, 0.0).storage,
      );

    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(BubblePainter oldDelegate) {
    // ensures the oldDelegate (Object disposed) properties don't match current (New instance of Object)
    // i.e. only repaint if actual changes occured
    return oldDelegate.ancestorScrollable != ancestorScrollable ||
        oldDelegate.bubbleBackgroundContext != bubbleBackgroundContext ||
        oldDelegate.colors != colors;
  }
}

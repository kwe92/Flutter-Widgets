import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/widgets/barier.dart';

class AnimatedPortalTarget extends StatelessWidget {
  final bool visible;
  final VoidCallback onPressed;
  final Anchor anchor;
  final Widget target;
  final Widget follower;

  const AnimatedPortalTarget({
    required this.visible,
    required this.onPressed,
    required this.anchor,
    required this.follower,
    required this.target,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Barrier(
        isVisible: visible,
        onPressed: onPressed,
        target: PortalTarget(
          visible: visible,
          anchor: anchor,
          closeDuration: kThemeAnimationDuration,
          // animated follower widget
          portalFollower: TweenAnimationBuilder<double>(
            duration: kThemeAnimationDuration,
            curve: Curves.easeOut,
            tween: Tween(begin: 0, end: visible ? 1 : 0),
            builder: (context, progress, _) => Transform(
              transform:
                  // translation == slide on some axis
                  Matrix4.translationValues(0, (1 - progress) * 50, 0),
              child:
                  // fade-in and fade-out
                  Opacity(
                opacity: progress,
                child: follower,
              ),
            ),
          ),
          // target widget
          child: target,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

/// Barrier: parent PortalTarget that wraps follower and target
/// to detect if the users clicked outside follower to close it (change the follower visibility)
class Barrier extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;
  final Widget target;

  const Barrier({
    required this.isVisible,
    required this.onPressed,
    required this.target,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PortalTarget(
        visible: isVisible,
        closeDuration: kThemeAnimationDuration,
        portalFollower: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          // ! required if you want a background for modal with animation
          // child: Container(color: Colors.purple),
          // child: TweenAnimationBuilder(
          //   tween: ColorTween(
          //     begin: Colors.transparent,
          //     end: isVisible ? Colors.black54 : Colors.transparent,
          //   ),
          //   duration: kThemeAnimationDuration,
          //   builder: (context, color, _) {
          //     return ColoredBox(color: color!);
          //   },
          // ),
        ),
        // target widget
        child: target,
      );
}

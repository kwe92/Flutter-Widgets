import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/controllers/expandable_fab_controller.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/close_expanding_fab.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/expanding_action_button.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/open_expanding_fab.dart';
import 'package:provider/provider.dart';

@immutable
class ExpandableFab extends StatelessWidget {
  final bool? initialOpen;

  final double distance;

  final List<Widget> children;

  const ExpandableFab({
    required this.distance,
    required this.children,
    this.initialOpen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ExpandableFabController(initialOpen: true),
      builder: (BuildContext context, Widget? _) {
        final controller = context.read<ExpandableFabController>();
        return SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              const CloseExpandingFab(),
              ...[
                for (var i = 0, angleInDegrees = 0.0, count = children.length, step = 90.0 / (count - 1);
                    i < count;
                    i++, angleInDegrees += step)
                  ExpandingActionButton(
                    directionInDegrees: angleInDegrees,
                    maxDistance: distance,
                    progress: controller.expandAnimation,
                    child: children[i],
                  ),
              ],
              const OpenExpandingFab(),
            ],
          ),
        );
      },
    );
  }
}

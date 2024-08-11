import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/controllers/expandable_fab_controller.dart';
import 'package:provider/provider.dart';

@immutable
class CloseExpandingFab extends StatelessWidget {
  const CloseExpandingFab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ExpandableFabController>();

    const double size = 56;

    return SizedBox(
      width: size,
      height: size,
      child: Center(
        // creates a circular button with a box shadow
        child: Material(
          shape: const CircleBorder(),
          // achieve a smoother look for circles
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          // add splash effect with InkWell
          child: InkWell(
            onTap: controller.toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

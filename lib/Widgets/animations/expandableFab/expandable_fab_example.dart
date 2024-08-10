import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/action_button.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/expandable_fab.dart';

class ExpandableFabExample extends StatefulWidget {
  const ExpandableFabExample({super.key});

  @override
  State<ExpandableFabExample> createState() => _ExpandableFabExampleState();
}

class _ExpandableFabExampleState extends State<ExpandableFabExample> {
  @override
  void initState() {
    super.initState();
  }

  void _notifyWidget() => setState(() {});

  void _showAction(BuildContext context, int index) {
    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ExpandableFab(
          distance: 106,
          children: [
            ActionButton(
              onPressed: () => _showAction(context, 0),
              icon: const Icon(
                Icons.format_size,
              ),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 1),
              icon: const Icon(
                Icons.insert_photo,
              ),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 2),
              icon: const Icon(
                Icons.videocam,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Material Widget

//   - can be used with a sized box to create different shapes

//   - has shadowColor and elevation properties to easily add box shadows to the widget

// Custom Cross Fade

//   - have the fading widget sit ontop of the widget you want to fade into

//   - achieving the cross-fade animation is done by using an AnimatedContainer with a scaling transformer and an AnimatedOpacity widget

// IgnorePointer

//   - used to ignore hit detection events

//   - useful if there are tappable widgets stacked and one is transparent

// Interval

//   - take a fraction of the full animation time

//   - e.g. if an animation is 500ms then Interval(0.25, 1.0) means:

//       - begin 125ms (0.25 or %25.00) into the animation and finish at 500ms (1.0 or %100)

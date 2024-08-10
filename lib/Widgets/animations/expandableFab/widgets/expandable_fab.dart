import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/widgets/expanding_action_button.dart';

class ExpandableFab extends StatefulWidget {
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
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _expandAnimation;

  bool _open = false;

  @override
  void initState() {
    super.initState();

    _open = widget.initialOpen ?? false;

    _controller = AnimationController(
      vsync: this,
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
    );

    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  void _notifyWidget() => setState(() {});

  void _toggle() {
    _open = !_open;

    _open ? _controller.forward() : _controller.reverse();

    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          Builder(builder: _buildTapToCloseFab),
          ..._buildExpandingActionButtons(),
          Builder(builder: _buildTapToOpenFab),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() => [
        for (var i = 0, angleInDegrees = 0.0, count = widget.children.length, step = 90.0 / (count - 1);
            i < count;
            i++, angleInDegrees += step)
          ExpandingActionButton(
            directionInDegrees: angleInDegrees,
            maxDistance: widget.distance,
            progress: _expandAnimation,
            child: widget.children[i],
          ),
      ];

  // List<Widget> _buildExpandingActionButtons() {
  //   final children = <Widget>[];

  //   final count = widget.children.length;

  //   final step = 90.0 / (count - 1);

  //   for (var i = 0, angleInDegrees = 0.0; i < count; i++, angleInDegrees += step) {
  //     children.add(
  //       ExpandingActionButton(
  //         directionInDegrees: angleInDegrees,
  //         maxDistance: widget.distance,
  //         progress: _expandAnimation,
  //         child: widget.children[i],
  //       ),
  //     );
  //   }

  //   return children;
  // }

  Widget _buildTapToCloseFab(BuildContext context) {
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
            onTap: _toggle,
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

  // ?? why not use AnimatedCrossFade?
  /// a button that scales up and down, fading in and out respectively
  Widget _buildTapToOpenFab(BuildContext context) {
    return IgnorePointer(
      // option to ignore button tap
      ignoring: _open,
      // animate size
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        // button scale
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        // animate visiblity
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 250),
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(Icons.create),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

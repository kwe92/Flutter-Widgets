import 'package:flutter/material.dart';
import 'package:flutter_widgets/drag_physics_simulation/draggable_card.dart';

class DragPhysicsExample extends StatelessWidget {
  const DragPhysicsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: AppBarWithDropShadow(
          title: Text("Drag Phsyics"),
        ),
      ),
      body: DraggableCard(
        child: Icon(
          color: Colors.lightBlue,
          Icons.flutter_dash,
          size: 128,
        ),
      ),
    );
  }
}

// AppBar with drop shadow underneath.
class AppBarWithDropShadow extends StatelessWidget {
  final Widget title;

  final Color? shadowColor;

  final double? spreadRadius;

  final Color? backgroundColor;

  const AppBarWithDropShadow({
    required this.title,
    this.shadowColor,
    this.spreadRadius = 2,
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: spreadRadius,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      shadowColor: shadowColor ?? Colors.black.withOpacity(0.25),
      title: title,
    );
  }
}

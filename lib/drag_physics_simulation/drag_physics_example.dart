import 'package:flutter/material.dart';
import 'package:flutter_widgets/drag_physics_simulation/draggable_card.dart';

class DragPhysicsExample extends StatelessWidget {
  const DragPhysicsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithDropShadow(
        title: const Text("Drag Phsyics"),
      ),
      body: const DraggableCard(
        child: Icon(
          color: Colors.lightBlue,
          Icons.flutter_dash,
          size: 128,
        ),
      ),
    );
  }
}

/// AppBar with drop shadow underneath.
class AppBarWithDropShadow extends AppBar {
  AppBarWithDropShadow._internal({
    super.elevation,
    super.backgroundColor,
    super.surfaceTintColor,
    super.shadowColor,
    super.title,
    super.actions,
  });
  factory AppBarWithDropShadow({
    required Widget title,
    double elevation = 3,
    Color backgroundColor = Colors.white,
    Color? surfaceTintColor = Colors.white,
    Color? shadowColor,
    List<Widget>? actions,
  }) =>
      AppBarWithDropShadow._internal(
        title: title,
        elevation: elevation,
        backgroundColor: backgroundColor,
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor ?? Colors.black.withOpacity(0.20),
        actions: actions,
      );
}

//?? AppBarWithDropShadow that can be marked as const but requires a PreferredSize to be wrapped around it

// class AppBarWithDropShadow extends StatelessWidget {
//   final Widget title;

//   final Color? shadowColor;

//   final double? spreadRadius;

//   final Color? backgroundColor;

//   const AppBarWithDropShadow({
//     required this.title,
//     this.shadowColor,
//     this.spreadRadius = 2,
//     this.backgroundColor = Colors.white,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: spreadRadius,
//       backgroundColor: backgroundColor,
//       surfaceTintColor: Colors.transparent,
//       shadowColor: shadowColor ?? Colors.black.withOpacity(0.25),
//       title: title,
//     );
//   }
// }

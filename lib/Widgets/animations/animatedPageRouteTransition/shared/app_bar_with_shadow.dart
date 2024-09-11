import 'package:flutter/material.dart';

// Seems to be the simplest implementation
class AppBarWithDropShadow extends AppBar {
  AppBarWithDropShadow({
    required super.title,
    super.elevation = 2,
    super.backgroundColor = Colors.white,
    super.actions,
    super.surfaceTintColor = Colors.transparent,
    Color? shadowColor,
    super.key,
  }) : super(
          shadowColor: shadowColor ?? Colors.black.withOpacity(0.25),
        );
}

//------------------------------------------------------------------------------------------------------------------------------//

class AppBarWithDropShadow2 extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  final Color? shadowColor;

  final double? spreadRadius;

  final Color? backgroundColor;

  final List<Widget>? actions;

  const AppBarWithDropShadow2({
    required this.title,
    this.shadowColor,
    this.spreadRadius = 2,
    this.backgroundColor = Colors.white,
    this.actions,
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
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//------------------------------------------------------------------------------------------------------------------------------//

class AppBarWithDropShadow3 extends AppBar {
  AppBarWithDropShadow3._internal({
    super.elevation,
    super.backgroundColor,
    super.surfaceTintColor,
    super.shadowColor,
    super.title,
    super.actions,
  });

  factory AppBarWithDropShadow3({
    required Widget title,
    double elevation = 3,
    Color backgroundColor = Colors.white,
    Color? surfaceTintColor = Colors.white,
    Color? shadowColor,
    List<Widget>? actions,
  }) =>
      AppBarWithDropShadow3._internal(
        title: title,
        elevation: elevation,
        backgroundColor: backgroundColor,
        surfaceTintColor: surfaceTintColor,
        shadowColor: shadowColor ?? Colors.black.withOpacity(0.20),
        actions: actions,
      );
}

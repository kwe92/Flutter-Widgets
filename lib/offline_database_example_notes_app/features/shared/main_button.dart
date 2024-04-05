import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/colors.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/theme/theme.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color? backgroundColor;

  final Widget child;
  const MainButton({
    required this.onTap,
    required this.height,
    this.width = double.maxFinite,
    required this.child,
    this.backgroundColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Theme(
        data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                  backgroundColor: resolver(
                    backgroundColor ?? AppColorsNotes.mainThemeColor,
                  ),
                ),
          ),
        ),
        child: OutlinedButton(
          onPressed: onTap,
          child: child,
        ),
      ),
    );
  }
}

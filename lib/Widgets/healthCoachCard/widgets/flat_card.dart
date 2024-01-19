import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';

class FlatCard extends StatelessWidget {
  const FlatCard({
    super.key,
    required this.child,
    this.selected = false,
    this.onTap,
    this.borderRadius,
    this.padding,
    this.borderColor,
  });

  final Widget child;
  final bool selected;
  final BorderRadius? borderRadius;
  final double? padding;
  final Function? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: selected ? CareNavigationColors.tpMidBlue.withOpacity(.08) : Colors.white,
          borderRadius: borderRadius ?? circular4,
          border: Border.all(color: selected ? CareNavigationColors.tpMidBlue : borderColor ?? Colors.black26),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              color: Colors.white.withOpacity(0.15),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius ?? circular4,
          onTap: onTap != null ? () => onTap!() : null,
          child: Padding(
            padding: EdgeInsets.all(padding ?? 16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularIconButtton extends StatelessWidget {
  final Widget icon;
  final Color? backbroundColor;
  final VoidCallback? onTap;

  const CircularIconButtton({
    required this.icon,
    this.backbroundColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: backbroundColor ?? const Color(0xff1D1D1D).withOpacity(0.40),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

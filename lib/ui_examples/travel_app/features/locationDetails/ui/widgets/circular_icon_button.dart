import 'package:flutter/material.dart';

class CircularIconButtton extends StatelessWidget {
  final Widget icon;
  final Color? backbroundColor;

  const CircularIconButtton({
    required this.icon,
    this.backbroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: backbroundColor ?? const Color(0xff1D1D1D).withOpacity(0.40),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}

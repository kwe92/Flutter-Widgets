import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final double height;
  final Widget child;
  const MainButton({
    required this.height,
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: () {},
        child: child,
      ),
    );
  }
}

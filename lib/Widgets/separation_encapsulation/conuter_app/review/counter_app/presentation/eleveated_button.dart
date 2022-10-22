import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.onPressed,
      required this.child,
      this.color = const Color.fromRGBO(109, 130, 3, 1),
      super.key});
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

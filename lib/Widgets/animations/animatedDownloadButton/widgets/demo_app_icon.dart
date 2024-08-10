import 'package:flutter/material.dart';

class DemoAppIcon extends StatelessWidget {
  const DemoAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: const Icon(
        Icons.ac_unit,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

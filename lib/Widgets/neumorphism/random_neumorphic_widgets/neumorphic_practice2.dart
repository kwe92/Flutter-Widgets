import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphicPractice2 extends StatefulWidget {
  const NeumorphicPractice2({super.key});

  @override
  State<NeumorphicPractice2> createState() => _NeumorphicPractice2State();
}

class _NeumorphicPractice2State extends State<NeumorphicPractice2> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Colors.grey[100]!;
    final Offset distance =
        isPressed ? const Offset(6, 6) : const Offset(12, 12);
    final double blur = isPressed ? 5 : 15.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isPressed = !isPressed;
              });
              await Future.delayed(const Duration(milliseconds: 50));
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(microseconds: 50),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: backgroundColor,
                  boxShadow: <BoxShadow>[
                    // right shadow
                    BoxShadow(
                        blurRadius: blur,
                        offset: distance,
                        color: Colors.grey[500]!,
                        inset: isPressed),
                    // left shadow
                    BoxShadow(
                        blurRadius: blur,
                        offset: -distance,
                        color: Colors.white,
                        inset: isPressed)
                  ]),
              child: const Center(
                child: Text(
                  '8',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NeumorphicPractice1 extends StatelessWidget {
  const NeumorphicPractice1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Neumorphic Practice 1'),
        ),
        body: Center(
            child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
              boxShadow: <BoxShadow>[
                // Top Left Shadow is Light
                const BoxShadow(
                    color: Colors.white,
                    // offset property:
                    // - (x, y)
                    // - (0,0) in the middle
                    // - negatives are on  the top left
                    // - possitive numbers are on the bottom right
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 2),
                // Bottom Right Shadow is Dark
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 2)
              ],
            ),
            child: const Text('Hello'),
          ),
        )),
      ),
    );
  }
}

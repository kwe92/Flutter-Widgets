import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightGreen,
          appBar: AppBar(
            title: const Text('Screen C'),
          ),
          body: Container(),
        ),
      );
}

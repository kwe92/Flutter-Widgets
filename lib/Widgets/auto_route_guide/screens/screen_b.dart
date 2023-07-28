import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(
            title: const Text('Screen B'),
          ),
          body: Container(),
        ),
      );
}

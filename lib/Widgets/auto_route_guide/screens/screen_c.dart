import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
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

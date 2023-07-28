import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purple,
          appBar: AppBar(
            title: const Text('Screen A'),
          ),
          body: Container(),
        ),
      );
}

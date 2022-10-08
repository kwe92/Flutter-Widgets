// Hero Widget

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/screen_one.dart';

class WorkingWithHero extends StatelessWidget {
  const WorkingWithHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Working With Hero Screen 1'),
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScreenOne()));
          },
          child: Container(
              alignment: Alignment.topLeft,
              width: 400,
              height: 200,
              child: Hero(
                  tag: 'tag1', child: Image.asset('assets/sololvl.jpeg')))),
    );
  }
}

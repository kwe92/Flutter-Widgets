import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/base_screen.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: '',
      body: Hero(
        tag: 'tag1',
        child: Image.asset('assets/sololvl.jpeg'),
      ),
    );
  }
}

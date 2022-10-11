// Hero Widget
//    - When clicking on an image the User visual is never broken
//    - If you don't recall what the widget does remove Hero from both images
//      and watch what visually happens

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/base_screen.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/screen_two.dart';

class WorkingWithHero extends StatelessWidget {
  const WorkingWithHero({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: 'Working With Hero Screen 1',
        body: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScreenTwo(
                        title: 'Working With Hero Screen 2',
                      )));
            },
            child: Container(
                alignment: Alignment.topLeft,
                width: 400,
                height: 200,
                child: Hero(
                    tag: 'tag1', child: Image.asset('assets/sololvl.jpeg')))));
  }
}

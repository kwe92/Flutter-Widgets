// Animated Cross Fade
//  - A widget that cross-fades between two given children
//    and animates itself between their sizes
//
//
// nl

import 'package:flutter/material.dart';

class AnimatedCrossFadeApp extends StatefulWidget {
  const AnimatedCrossFadeApp({super.key});
  final title = 'Animated Cross Fade';

  @override
  State<AnimatedCrossFadeApp> createState() => _AnimatedCrossFadeAppState();
}

Widget _customColumn(String text, String image) => Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 50.0),
        ),
        const SizedBox(height: 6.0),
        Image.asset(image)
      ],
    );

class _AnimatedCrossFadeAppState extends State<AnimatedCrossFadeApp> {
  // ignore: prefer_final_fields
  bool _boolValue = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _boolValue = !_boolValue;
                });
              },
              child: const Text(
                'Switch',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: AnimatedCrossFade(
            firstChild: _customColumn('Isekai', 'assets/isekai.jpeg'),
            secondChild: _customColumn('Seinen', 'assets/seinen.webp'),
            duration: const Duration(seconds: 1),
            crossFadeState: _boolValue
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond),
      ),
    );
  }
}

// Wrap Widget (Layout Widget)
//  - Make sure to put the first element under the first line
//  - Display children in multiple horizontal and vertical runs
//
//
// nl

// TODO: Finish working on this

import 'package:flutter/material.dart';

class WorkingWithWrap extends StatelessWidget {
  WorkingWithWrap({super.key});

  final Widget image = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image.asset(
      height: 100,
      width: 100,
      fit: BoxFit.cover,
      'assets/sololvl.jpeg',
    ),
  );

  List<Widget> get _imageList => [for (var i = 0; i < 12; i++) image];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With Wrap Widget'),
        ),
        body: Center(
            child: Wrap(
          //spacing: 5,
          children: _imageList,
        )),
      ),
    );
  }
}

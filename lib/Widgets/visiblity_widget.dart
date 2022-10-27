// Visibility
//  - Can be used on any widget to make it visable or not

import 'package:flutter/material.dart';

TextStyle textStyle = const TextStyle(color: Colors.white);

Image img({String image = 'assets/isekai.jpeg'}) =>
    Image.asset(height: 100, image);

Widget buttonText(bool isVisible) => isVisible
    ? Text(
        'Hide Image',
        style: textStyle,
      )
    : Text(
        'Show Image',
        style: textStyle,
      );

class WorkingWithVisibility extends StatefulWidget {
  const WorkingWithVisibility({super.key});

  @override
  State<WorkingWithVisibility> createState() => _WorkingWithVisibilityState();
}

class _WorkingWithVisibilityState extends State<WorkingWithVisibility> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Working With Visibility'),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: buttonText(_isVisible)),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                img(),
                Visibility(
                  visible: _isVisible,
                  child: img(image: 'assets/sololvl.jpeg'),
                ),
                img(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

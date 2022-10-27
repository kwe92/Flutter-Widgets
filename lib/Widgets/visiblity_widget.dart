// Visibility
//  - Can be used on any widget to make it visable or not

import 'package:flutter/material.dart';

// Practiced decoupling code

// Declared and initalized textStyle variable
//    - reduce duplication
//    - we chose to use a variable because we do not
//      need a arguments
TextStyle textStyle = const TextStyle(color: Colors.white);

// Create a function that returns an Image Object
//    - We chose to create a function instead of a variable
//      because we need an optional named argument to change the image
//    - we have a default named / keyword argument
//    = we chose to use an arrow lambda function for brevity

Image img({String image = 'assets/isekai.jpeg'}) =>
    Image.asset(height: 100, image);

// Create a function that returns an Text Object
//    - We chose to create a function instead of a variable
//      because we need a required positional argument
//      to change the Text widget returned
//    - We used a conditional (ternary) operator to decide what
//      Text Widget is returned
//    ternary syntax:
//      - boolean_condition ? object_to_return_if_true : object_to_return_if_false
// nl
Text buttonText(bool isVisible) => isVisible
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
                // Anonymous function to change the state
                //    of _isVisible boolean variable
                //??    ! is is prefixed before _isVisible to switch the boolean value to its inverse
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

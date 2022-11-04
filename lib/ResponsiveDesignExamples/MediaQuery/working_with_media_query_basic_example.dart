// MediaQuery
//   - Can be used to learn the size of the current media
//   - Using MediaQuery.of in your build methods will cause
//     the widget to rebuild every time the MediaQueryData is changed
//   - If a user somehow changes the size of the app in anyway the build function is triggered to run

import 'package:flutter/material.dart';

class WorkingWithMediaQuery extends StatelessWidget {
  const WorkingWithMediaQuery({super.key});

  // A custom Text widget to adhere to DRY
  Widget customTextWidget(String text, double mediaExtent) => Text(
        text + mediaExtent.toString(),
        style: const TextStyle(fontSize: 40),
      );

  // This section of the widget tree is rebuilt everytime the size is changed??

  @override
  Widget build(BuildContext context) {
    // The Size of the current Media given its context
    final Size currentMediaSize = MediaQuery.of(context).size;
    // The width or horizontal extent of the currentMediaSize variable
    final double currentWidth = currentMediaSize.width;
    // The height of the vertical extent of the currentMediaSize variable
    final double currentHeight = currentMediaSize.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With MediaQueryData'),
        ),
        body: Center(
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customTextWidget('Current Width: ', currentWidth),
                const SizedBox(
                  width: 16.0,
                ),
                customTextWidget('Current Height: ', currentHeight)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

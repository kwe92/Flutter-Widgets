import 'package:flutter/material.dart';

class WorkingWithColoredBox extends StatelessWidget {
  const WorkingWithColoredBox({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              'Working with ColoredBox',
            ),
          ),
          body: const Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ColoredBox(
                    color: Color.fromRGBO(96, 125, 139, 1),
                    child: SizedBox(
                      height: 125,
                      width: 125,
                      child: Center(
                        child: Text('Painted Box'),
                      ),
                    ),
                  ),
                ),
                ColoredBox(
                  color: Color.fromRGBO(96, 125, 139, 1),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Can be used instead of a container if you just need to paint the background',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

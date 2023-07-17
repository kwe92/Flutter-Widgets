import 'package:flutter/material.dart';

// GridView

//   - Create an evenly spaced grid of widgets on N length

// GridView.count

//   - a named constructor providing the easiest way to generate a GridView
//   - default grid scrollDirection (orientation) is column
//   - only required property is crossAxisCount which specifies the column or row count
//     based on the scrollDirection

class WorkingWithGridView extends StatelessWidget {
  const WorkingWithGridView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Working With Gridview'),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              ...List.generate(
                20,
                (int index) => Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: ColoredBox(
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          'Index: $index',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

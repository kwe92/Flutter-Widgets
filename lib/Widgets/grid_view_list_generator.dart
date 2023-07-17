import 'package:flutter/material.dart';

class WorkingWithGridView extends StatelessWidget {
  const WorkingWithGridView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Working WIth Gridview'),
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

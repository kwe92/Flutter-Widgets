import 'package:flutter/material.dart';

class WorkWithBuilderWidget extends StatelessWidget {
  const WorkWithBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With Builder'),
        ),
        body: customBuilderTextWidget(),
      ),
    );
  }
}

Widget customBuilderTextWidget() => Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        // The Bulder Widget will give you access to a new context
        // Creates a widget that delegates its build to a callback
        // Useful for accessing the build method of certain widgets
        child: Builder(
          builder: (BuildContext textWidgetContext) => Text(
            'Working with builder',
            style: Theme.of(textWidgetContext).textTheme.displayLarge,
          ),
        ),
      ),
    );

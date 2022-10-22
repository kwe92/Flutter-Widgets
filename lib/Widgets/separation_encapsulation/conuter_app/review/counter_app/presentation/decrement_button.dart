import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'eleveated_button.dart';
import 'providers/count_provider.dart';

class CounterDecrementor extends StatelessWidget {
  const CounterDecrementor({required this.onPressed, super.key});
  final VoidCallback onPressed;
  final Widget text = const Text('Decrement');

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final count = ref.read(countProvider.state).state;
        final returnedWidget = count > 0
            ? CustomElevatedButton(onPressed: onPressed, child: text)
            : CustomElevatedButton(
                onPressed: () {}, color: Colors.grey, child: text);
        return returnedWidget;
      },
    );
  }
}

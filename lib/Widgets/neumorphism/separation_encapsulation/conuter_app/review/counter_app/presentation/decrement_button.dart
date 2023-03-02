import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/layout.dart';
import 'custom_neumorphic_button.dart';
import 'providers/count_provider.dart';

class CounterDecrementor extends StatelessWidget {
  CounterDecrementor({required this.onPressed, super.key});
  final VoidCallback onPressed;
  final Widget text = const Text('Decrement');

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final count = ref.read(countProvider.state).state;
        final returnedWidget = count > 0
            ? CustomNeumorphicButton(
                onPressed: onPressed,
                color: AppColor.main,
                child: text,
              )
            : CustomNeumorphicButton(
                onPressed: () {}, color: Colors.grey, child: text);
        return returnedWidget;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/value_notifier/value_notifier_counter_model.dart';

class ValueNotifierCounter extends StatelessWidget {
  const ValueNotifierCounter({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Working With ValueNotifier'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: ValueNotifierCounterModel.countNotifier,
                  builder: (BuildContext context, int counterValue, _) => Text(
                    'Count: $counterValue',
                    style: const TextStyle(fontSize: 21),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const OutlinedButton(
                  onPressed: ValueNotifierCounterModel.increment,
                  child: Text('Increment'),
                ),
                const SizedBox(
                  height: 12,
                ),
                const OutlinedButton(
                  onPressed: ValueNotifierCounterModel.decrement,
                  child: Text('Decrement'),
                ),
              ]),
            ),
          ),
        ),
      );
}

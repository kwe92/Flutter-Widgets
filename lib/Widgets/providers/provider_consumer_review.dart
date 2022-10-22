import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class WorkingWithCunsumerExample1 extends ConsumerWidget {
  const WorkingWithCunsumerExample1({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                // This builder will only get called when the counterProvider
                // is updated.
                final count = ref.watch(counterProvider.state).state;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('$count'),
                    child!,
                  ],
                );
              },
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: const Text('Good job!'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () => ref.read(counterProvider.state).state++,
      ),
    );
  }
}

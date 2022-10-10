// StreamBuilder
//   - If you have a flow data coming from a Stream
//     like FireBase
//   - StreamBuilder allows you to use the data as soon as you recieve it

import 'package:flutter/material.dart';

class WorkingWithStreamBuilder extends StatefulWidget {
  const WorkingWithStreamBuilder({super.key});

  @override
  State<WorkingWithStreamBuilder> createState() =>
      _WorkingWithStreamBuilderState();
}

// A variable that is initalized as a Anonymous function
// allows for the ability to call the function without parenthesis
Stream<int> generatorStream = (() async* {
  await Future.delayed(const Duration(seconds: 3));
  yield 1;
  await Future.delayed(const Duration(seconds: 2));
  yield 2;
  await Future.delayed(const Duration(seconds: 2));
  yield 3;
})();

Stream<int> generatorStream2() async* {
  await Future.delayed(const Duration(seconds: 3));
  yield 1;
  await Future.delayed(const Duration(seconds: 2));
  yield 2;
  await Future.delayed(const Duration(seconds: 2));
  yield 3;
}

class _WorkingWithStreamBuilderState extends State<WorkingWithStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const FittedBox(
            child: Text('Working With StreamBuilder'),
          ),
          leading: const Icon(Icons.menu),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: Center(
          child: StreamBuilder(
              stream: generatorStream,
              initialData: 0,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator.adaptive();
                }
                if (snapshot.hasError) {
                  return const Text('There was an error generating data!');
                } else {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(fontSize: 40.0),
                  );
                }
              })),
        ),
      ),
    );
  }
}

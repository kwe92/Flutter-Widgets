import 'package:flutter/material.dart';

class WorkingWithFutureBuilder extends StatefulWidget {
  const WorkingWithFutureBuilder({super.key});

  @override
  State<WorkingWithFutureBuilder> createState() =>
      _WorkingWithFutureBuilderState();
}

const _style = TextStyle(fontSize: 22.0);

Future<String> getData() async {
  await Future.delayed(const Duration(seconds: 2));
  //throw 'Error';
  return 'Coding is hard but fun!';
}

class _WorkingWithFutureBuilderState extends State<WorkingWithFutureBuilder> {
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Builder Example',
      theme:
          ThemeData(brightness: darkMode ? Brightness.dark : Brightness.light),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: FittedBox(
              child: Text(
                darkMode
                    ? 'Future Builder Example: Dark Mode'
                    : 'Future Builder Example: Light Mode',
                style: _style,
              ),
            ),
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.hasError.toString(),
                    style: _style,
                  ),
                );
              }
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Coding is hard but fun!',
                      style: _style,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 38.0,
                      width: 270,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: darkMode ? Colors.orange : null),
                        onPressed: () {
                          setState(
                            () {
                              darkMode = !darkMode;
                            },
                          );
                        },
                        child: const FittedBox(
                          child: Text('Refresh'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

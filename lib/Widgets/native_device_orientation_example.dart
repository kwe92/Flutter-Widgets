// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

class WorkingWithNativeDeviceOrientation extends StatefulWidget {
  const WorkingWithNativeDeviceOrientation({super.key});
  @override
  _WorkingWithNativeDeviceOrientationState createState() => _WorkingWithNativeDeviceOrientationState();
}

class _WorkingWithNativeDeviceOrientationState extends State<WorkingWithNativeDeviceOrientation> {
  bool useSensor = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Native Orientation Example'),
            actions: <Widget>[
              const Center(child: Text('Sensor:')),
              Switch(value: useSensor, onChanged: (val) => setState(() => useSensor = val)),
            ],
          ),
          body: NativeDeviceOrientedWidget(
            landscape: (context) {
              return const Center(child: Text('Native Orientation: Landscape (Unknown Side)\n'));
            },
            landscapeLeft: (context) {
              return const Center(child: Text('Native Orientation: Landscape Left\n'));
            },
            landscapeRight: (context) {
              return const Center(child: Text('Native Orientation: Landscape Right\n'));
            },
            portrait: (context) {
              return const Center(child: Text('Native Orientation: Portrait (Unknown Side)\n'));
            },
            portraitUp: (context) {
              return const Center(child: Text('Native Orientation: Portrait Up\n'));
            },
            portraitDown: (context) {
              return const RotatedBox(quarterTurns: 2, child: Center(child: Text('Native Orientation: Portrait Down\n')));
            },
            fallback: (context) {
              return const Center(child: Text('Native Orientation: Unknown\n'));
            },
            useSensor: useSensor,
          ),
          floatingActionButton: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    child: const Text('Sensor'),
                    onPressed: () async {
                      final orientation = await NativeDeviceOrientationCommunicator().orientation(useSensor: true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Native Orientation read: $orientation'),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    child: const Text('UI'),
                    onPressed: () async {
                      final orientation = await NativeDeviceOrientationCommunicator().orientation(useSensor: false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Native Orientation read: $orientation'),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          )),
    );
  }
}

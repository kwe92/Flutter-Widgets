import 'package:flutter/material.dart';

// showBottomSheet
//  - Show a modal Material Design Bottomsheet
//  - An alternative to a menu or dialog box
//  - Prevents the user from inter acting with the rest of the app until closed

class BottomModalApp extends StatefulWidget {
  const BottomModalApp({super.key});
  final Text title = const Text('Working With Bottom Modal');

  @override
  State<BottomModalApp> createState() => _BottomModalAppState();
}

bottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 400,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Pop the bottom sheet off of the stack
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ),
      ),
    );

class _BottomModalAppState extends State<BottomModalApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            bottomSheet(context);
          },
          child: const Text('Modal Bottom Sheet'),
        ),
      ),
    );
  }
}

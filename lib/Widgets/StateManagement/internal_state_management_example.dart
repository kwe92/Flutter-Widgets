// A Stateful Widget TapBoxA
//  - Takes no argument
//  - A square container 200 X 200
//  - Green if active with text 'active'
//  - Grey if inactive with text 'inactive'
//
//  A Parent Stateless Widget
//  - Wraps the widget to be displayed in a MaterialApp
//    and Scaffold
// nl

import 'package:flutter/material.dart';

// Private const variable to handle text styling
const _textStyle = TextStyle(fontSize: 26.0, color: Colors.white);

// TapBoxA is a StatefulWidget that manages its own state
class TapBoxA extends StatefulWidget {
  const TapBoxA({super.key});

  @override
  State<TapBoxA> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  // Private boolean value to control if
  // the container is active or inactive
  bool _active = true;

  // Decoupled code and placed the active and inactive
  // widgets into variables for separation of concerns
  final Widget activeText = const Text('Active', style: _textStyle);
  final Widget inactiveText = const Text('Inactive', style: _textStyle);

  // A function to be passed to GestureDetector onTap property
  // to handle onTap events and upadte the UI

  void _handleTap() => setState(() {
        _active = !_active;
      });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        // Use conditional (ternary) operators
        // to determine what configuration and state to display
        decoration: BoxDecoration(color: _active ? Colors.green : Colors.grey),
        child: Center(
          child: _active ? activeText : inactiveText,
        ),
      ),
    );
  }
}

class InternalStateManagementExample extends StatelessWidget {
  const InternalStateManagementExample({super.key});

  final _title = 'Internal State MAnagement';

  @override
  Widget build(BuildContext context) {
    // Use materialApp for material design features
    return MaterialApp(
      title: _title,
      // Change the theme of the app to be dark
      theme: ThemeData(brightness: Brightness.dark),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: const Center(child: TapBoxA()),
        ),
      ),
    );
  }
}

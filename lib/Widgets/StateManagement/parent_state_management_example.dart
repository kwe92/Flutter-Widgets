// A Stateless Widget TapBoxB
//  - Its state is handled by its parent
//  - When a tap is detected the parent is notified
//  - Takes no argument
//  - A square container 200 X 200
//  - Green if active with text 'active'
//  - Grey if inactive with text 'inactive'
//
//  A Parent Stateful Widget
//  - Manages the _active state for TapBoxB
//  - Implements _handleTapboxChanged(), the method called when the box is tapped
//  - When the state changes, calls setState() to update the UI
//
//
//
// nl

import 'package:flutter/material.dart';

// A Parent StatefulWidget that manages the state of its child, which is a Stateless Widget
// Parents are best at managing user data
class ParentWidget extends StatefulWidget {
  // A const default constructor with no arguments, classes should be const whenever possible
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

// The state of the ParentWidget | managing its childs state
class _ParentWidgetState extends State<ParentWidget> {
  // Private mutable boolean variable indicating if the child is active or not
  bool _active = false;
  final _title = 'Parent State Management';

  // A method implemented to be called when the box is tapped
  // takes a boolean newValue variable that is passed to it from the child widget
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: _title,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: Center(
            child: TapBoxB(
              onChanged: _handleTapBoxChanged,
              active: _active,
            ),
          ),
        ),
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({this.active = false, required this.onChanged, super.key});
  final bool active;
  final Function(bool) onChanged;
  final TextStyle _textStyle =
      const TextStyle(fontSize: 30.0, color: Colors.white);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: active ? Colors.green : Colors.grey),
        child: Center(
          child: Text(
            active ? 'active' : 'Inactive',
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}

// Mix-And-Match State Management
//  - With a mix and match approach the parent handles
//    some of the state while the StatefulWidget
//    also manages an internal state of its own

// TapBoxC Widget:
// Manages _highlight state
// GesterDetecture to listen to tap events
// highlighted container border on tap down
//bool _highlight private member variable
//  named args:
//    active = false
//    onChanged

// Implementations for GestureDEtector:
//    _handleTapDown(TapDownDetails) _highlight true
//    _handleTapUp(TapDownDetails) _highlight false
//    _handleTapCancel() _highlight false
//    _handleTap onChanged | passes the state change to a parent widget
//
// ParentWidget
// manages _active state
// implements:
//  - _handleTapBoxChanged(bool newBool)
// nl

import 'package:flutter/material.dart';

class ParentWidget2 extends StatefulWidget {
  const ParentWidget2({super.key});

  @override
  State<ParentWidget2> createState() => _ParentWidget2State();
}

class _ParentWidget2State extends State<ParentWidget2> {
  bool _active = false;
  static const _title = 'Mix & Match State Management';
  // A callback to handle if the box has been tapped
  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: _title,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(_title),
          ),
          body: Center(
              child: TapBoxC(
            onChanged: _handleTapBoxChanged,
            active: _active,
          )),
        ),
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  const TapBoxC({super.key, this.active = false, required this.onChanged});
  final bool active;
  final void Function(bool) onChanged;

  @override
  State<TapBoxC> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  static const _textStyle = TextStyle(fontSize: 32.0, color: Colors.white);
  bool _hightLight = false;
  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _hightLight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _hightLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _hightLight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // called first
      onTapDown: _handleTapDown,
      // called second
      onTapUp: _handleTapUp,
      // called if canceled
      onTapCancel: _handleTapCancel,
      // Ussually Called last in the GestureDetector tap hierarchy
      onTap: _handleTap,
      // AnimatedContainer to anime the state changes
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: 200,
        height: 200,
        // BoxDecoration used to decorate a container
        decoration: BoxDecoration(
            color: widget.active ? Colors.green : Colors.grey,
            // Uses Border.all to add a border decoration around a Container
            border: _hightLight
                ? Border.all(width: 200, color: Colors.blue)
                : null),
        child: Center(
          // Used to fit the text as the container gets filled by the border if the user decides to hold down
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.active ? 'Active' : 'Inactive',
                style: _textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

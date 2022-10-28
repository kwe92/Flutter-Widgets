// BottomNavigationBar
//  - A material Widget that is displayed at the botton of an app
//  - Used mostly in conjunction with icons to select among a small number of views
//  - Best range of bottom nav bar elements is 3 to 5
//  - The botton nav bar type changes how its elements are displayed
//  - Can change the view of the current page or navigate to a new page entirely
// nl

import 'package:flutter/material.dart';

class WorkingWithBottomNavBar extends StatelessWidget {
  const WorkingWithBottomNavBar({super.key});
  static const String _title = 'WorkingWithBottomNavBar';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: BottomNavExample1(
        title: Text(_title),
      ),
    );
  }
}

class BottomNavExample1 extends StatefulWidget {
  const BottomNavExample1({required this.title, super.key});
  final Text title;

  @override
  State<BottomNavExample1> createState() => _BottomNavExample1State();
}

class _BottomNavExample1State extends State<BottomNavExample1> {
  // used to know which page we are on
  int _currentIndex = 0;
// A list of icons that we want to use as display
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: widget.title,
        ),
        body: Center(
          child: body[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // onTap returns a new bottom navigation bar item
          // index location to the closure
          // Update the current index with the index passed to the closure
          // from the onTap property
          onTap: (int newIndex) {
            // Call setState to update the current index
            setState(() {
              _currentIndex = newIndex;
            });
          },
          // the items parameter takes a list of
          // Bottom navigation items as arguments
          // Requires a label and an icon
          items: [
            BottomNavigationBarItem(label: 'Home', icon: body[0]),
            BottomNavigationBarItem(label: 'Menu', icon: body[1]),
            BottomNavigationBarItem(label: 'Profile', icon: body[2]),
          ],
        ),
      ),
    );
  }
}

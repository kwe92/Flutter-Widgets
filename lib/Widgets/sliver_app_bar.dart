// SliverAppBar
//    - Custom material design app bar scroll effects
//    - Integrates CustomScrollView Widget
//    - A responsive App Bar
//    - Allows you to have an app bar that can be:
//        - scrolled out of view
//        - Appear when scrolled up and disappear when scrolled down
//    - ScrollView responsive app bar, see AppBar for a static ap bar Widget
//    - Typically used as a first child of a CustomScrollView Widget
//      allowing the app bar vary in height according to the scroll offset
//      or float above the other content in the scroll view
//
// What is a Sliver?
//    - A Sliver is a portion of a scrollable area
//    - A finer grain control on implementing scrollable areas
//
// nl

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkingWithSliverAppBar extends StatelessWidget {
  const WorkingWithSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // if true: pins the app bar making the app bar static
              pinned: false,
              // if true: app bar disapears when scrolled down and reappears when scrolling up
              floating: true,
              // if true: snaps the flexible space bar into view,
              //          filling its alloted space automatically
              //          if if the area alloted is not reached and scrolling stops
              snap: false,
              expandedHeight: 450.0,
              //leadingWidth: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/sololvl.jpeg'),
                ),
                title: const Text('Flexible Space Bar'),
              ),
              title: const Text('Working With Sliver'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const Text(
                    'SLIVER',
                    style: TextStyle(fontSize: 475),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widgets/working_with_slivers/pinning_widgets_view_model_00.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

// TODO: Review what is going on with the Slivers

// TODO: add to transactions view implementation to make the top section disappear when scrolling

class PinningWidgets00 extends StatelessWidget {
  const PinningWidgets00({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Demo')),
      body: const CollapsingList(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  const CollapsingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PinningWidgets00ViewModel(),
      builder: (context, _) {
        final viewModel = context.watch<PinningWidgets00ViewModel>();

        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (userIsScrollingForward(notification)) {
              viewModel.setHeaderSectionSize(150);
              viewModel.calculateSizeAndPosition();
              print("scrolling forward");
            } else if (userIsScrollingDownward(notification)) {
              viewModel.setHeaderSectionSize(0);
              viewModel.calculateSizeAndPosition();
              print("scrolling downward");
            }
            return true;
          },
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: viewModel.headerSectionSize,
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "Header Section 1",
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              makeHeader('Header Section 2'),
              SliverFixedExtentList(
                key: viewModel.globalKey,
                itemExtent: 56.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: index != 0 ? 0 : 6.0, bottom: 6.0),
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: Text('List item $index'),
                    );
                  },
                  childCount: 100,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 150.0,
        maxHeight: 150.0,
        child: Container(color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
    );
  }

  bool userIsScrollingForward(UserScrollNotification notification) {
    return notification.direction == ScrollDirection.forward ? true : false;
  }

  bool userIsScrollingDownward(UserScrollNotification notification) {
    return notification.direction == ScrollDirection.reverse;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';

class TabBarWidget extends StatelessWidget {
  final String title;

  // list of tabs
  final List<Tab> tabs;

  // list of children the length of tabs
  final List<Widget> children;

  const TabBarWidget({
    required this.title,
    required this.tabs,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            // flexibleSpace is stacked behind the toolbar and app bar
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    SliderColors.tan0,
                    SliderColors.aqua0,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            // allows widget to appear accross the bottom of the AppBar
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: tabs,
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(children: children),
        ),
      );
}

// DefaultTabController

//   - used with TabBar and TabBarView Widgets to organize your Widgets into tabs
//   - keeps the selected tab and the visible content insync | matches TabBar tabs and TabBarView children
//   - required as an ancestor to TabBar if a TabController is not specified
//   - sits above the Scaffold Widget | wraps Scaffold Widget

// TabBar

//   - Displayed so the user can switch between diffrent sections
//   - holds tabs represented by the TabBarView and must have a 1-1 mapping with Tab to View

// TabBarView

//   - the content displayed once you create a TabBar
//   - each child in the list of children is associated with a Tab
//     from the list of tabs passed in as an argument to TabBar



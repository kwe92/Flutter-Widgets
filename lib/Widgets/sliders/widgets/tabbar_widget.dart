import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';

// TODO: Comment your code!

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    required this.title,
    required this.tabs,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
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
}

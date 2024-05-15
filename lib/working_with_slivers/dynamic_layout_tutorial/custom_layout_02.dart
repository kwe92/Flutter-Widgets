import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final centerWidgetKey = GlobalKey();

class CustomSliverLayout02 extends StatelessWidget {
  const CustomSliverLayout02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working With Slivers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              center: centerWidgetKey,
              slivers: [
                MiddleSection(
                  key: centerWidgetKey,
                ),
                const CustomSliver(child: TopSection()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 30,
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: GestureDetector(
                        onTap: () {
                          print("container: $index");
                        },
                        child: Container(
                          height: 120,
                          width: double.maxFinite,
                          color: Colors.orange,
                          child: Center(child: Text("container: $index")),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      color: Colors.green,
      child: const Text(
        "Top Section",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // pinned: true,
      // floating: true,
      toolbarHeight: 300,

      // flexibleSpace: widget behind title widget
      // flexibleSpace: SizedBox(
      //   height: double.maxFinite,
      //   width: double.maxFinite,
      //   child: Image.asset(
      //     "assets/seinen.webp",
      //     fit: BoxFit.fill,
      //   ),
      // ),
      // expandedHeight: retractable height
      // expandedHeight: 300,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        // SEARCH BAR
        child: Container(
          height: 500,
          color: Colors.blue,
          child: const Center(
            child: Text("Middle Section"),
          ),
        ),
      ),
    );
  }
}

// Custom SliverToBoxAdapter
class CustomSliver extends SingleChildRenderObjectWidget {
  const CustomSliver({required super.child, super.key});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverCustom();
  }
}

class RenderSliverCustom extends RenderSliverSingleBoxAdapter {
  RenderSliverCustom({super.child});
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    final SliverConstraints constraints = this.constraints;
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final double childExtent;

    // TODO: play with the SliverConstraints properties
    debugPrint("constraints.scrollOffset: ${constraints.scrollOffset}");

    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
      case Axis.vertical:
        childExtent = child!.size.height;
    }
    final double paintedChildSize = calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent = calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    // TODO: play with some of the SliverGeometry parameters
    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      // paintExtent: 50,
      paintOrigin: constraints.scrollOffset, // can determine hoe long a widget is pinned to the top
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent || constraints.scrollOffset > 0.0,
    );
    setChildParentData(child!, constraints, geometry!);
  }
}

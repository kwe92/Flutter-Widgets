import 'package:flutter/material.dart';

class CustomSliverLayout extends StatelessWidget {
  const CustomSliverLayout({super.key});

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
              slivers: [
                const SliverToBoxAdapter(child: TopSection()),
                const MiddleSection(),
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
      child: const Center(
        child: Text(
          "Top Section",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
      pinned: true,
      // floating: true,
      // toolbarHeight: 300,
      flexibleSpace: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.purple,
      ),
      expandedHeight: 300,
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
          height: 300,
          color: Colors.blue,
          child: const Center(
            child: Text("Middle Section"),
          ),
        ),
      ),
    );
  }
}

// Sliver Types

//   - Sliver to Sliver

//   - Sliver to Box

//   - Sliver to Many Slivers


// Slivers on the Outside, Child / Children are RenderBoxs | Sliver to Box

//   - SliverAppBar

//   - SliverList

//   - SliverToBoxAdapter


// Slivers on the Outside, Child / Slivers on the Outside | Sliver to Sliver

//   - SliverPadding

// Different Ways to Generate a List of Sliver Objects for RenderBox's

// # 1 | Builders are more effiecent as they only build and display visible widgets | Lazy Loading and Lazy Building

// SliverList.builder(
//                   itemCount: 30,
//                   itemBuilder: (context, index) => Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 6.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         print("container: $index");
//                       },
//                       child: Container(
//                         height: 120,
//                         width: double.maxFinite,
//                         color: Colors.purple,
//                         child: Center(child: Text("container: $index")),
//                       ),
//                     ),
//                   ),
//                 ),

// #2

//  SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     childCount: 30,
//                     (context, index) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 6.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           print("container: $index");
//                         },
//                         child: Container(
//                           height: 120,
//                           width: double.maxFinite,
//                           color: Colors.orange,
//                           child: Center(child: Text("container: $index")),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

// # 3

                // SliverList.builder(itemBuilder: itemBuilder)
                // ...List.generate(
                //   30,
                //   (index) => SliverToBoxAdapter(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 6.0),
                //       child: GestureDetector(
                //         onTap: () {
                //           print("container: $index");
                //         },
                //         child: Container(
                //           height: 120,
                //           width: double.maxFinite,
                //           color: Colors.orange,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
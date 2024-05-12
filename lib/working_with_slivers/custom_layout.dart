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
                ...List.generate(
                  30,
                  (index) => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: GestureDetector(
                        onTap: () {
                          print("container: $index");
                        },
                        child: Container(
                          height: 120,
                          width: double.maxFinite,
                          color: Colors.orange,
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
      floating: true,
      toolbarHeight: 300,
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
        ),
      ),
    );
  }
}

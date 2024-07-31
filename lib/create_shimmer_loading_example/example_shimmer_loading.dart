import "package:flutter/material.dart";
import "package:flutter_widgets/create_shimmer_loading_example/card_list_item.dart";
import "package:flutter_widgets/create_shimmer_loading_example/circle_list_item.dart";
import "package:flutter_widgets/create_shimmer_loading_example/shimmer.dart";
import "package:flutter_widgets/create_shimmer_loading_example/shimmer_loading.dart";

class ExampleShimmerLoading extends StatefulWidget {
  const ExampleShimmerLoading({super.key});

  @override
  State<ExampleShimmerLoading> createState() => _ExampleShimmerLoadingState();
}

class _ExampleShimmerLoadingState extends State<ExampleShimmerLoading> {
  bool _isLoading = false;

  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Shimmer(
            linearGradient: _defaultShimmerGradient,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      5,
                      (i) => _buildTopRowItem(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    // Ensure the widget can not scroll while the view is loading
                    physics: _isLoading ? const NeverScrollableScrollPhysics() : null,
                    itemCount: 5,
                    itemBuilder: (context, i) => _buildListItem(),
                    separatorBuilder: (context, i) => const SizedBox(height: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setLoading(!_isLoading),
          child: !_isLoading ? const Icon(Icons.hourglass_bottom) : const Icon(Icons.hourglass_full),
        ),
      ),
    );
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: const CircleListItem(),
    );
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }
}

const _defaultShimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),

    // Colors.orange,
    // Colors.blue,
    // Colors.orange
  ],
  stops: [
    // 0.1,
    // 0.3,
    // 0.4,

    0.1,
    0.1,
    0.2,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);



// Shimmer Shapes Overview

//   - Appoximate the kind of content that the user will see with place holder shapes

//   - text shapes: multi-line then rounded rectangular shapes
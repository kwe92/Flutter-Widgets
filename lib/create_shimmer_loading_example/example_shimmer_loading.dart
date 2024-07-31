import "package:flutter/material.dart";
import "package:flutter_widgets/create_shimmer_loading_example/card_list_item.dart";
import "package:flutter_widgets/create_shimmer_loading_example/circle_list_item.dart";
import "package:flutter_widgets/create_shimmer_loading_example/shimmer_provider.dart";
import "package:flutter_widgets/create_shimmer_loading_example/shimmer_wrapper.dart";

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
          child: ShimmerProvider(
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
                    // Ensure the widget can not scroll while the view is loading | if the view is allowed to scroll while shimmering an error will be thrown
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
    return ShimmerWrapper(
      isLoading: _isLoading,
      child: const CircleListItem(),
    );
  }

  Widget _buildListItem() {
    return ShimmerWrapper(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }
}



// Shimmer Shapes Overview

//   - Appoximate the kind of content that the user will see with place holder shapes

//   - text shapes: multi-line then rounded rectangular shapes
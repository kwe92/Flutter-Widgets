import 'package:flutter/material.dart';
import 'package:flutter_widgets/create_shimmer_loading_example/shimmer.dart';

/// Wraps child with ShaderMask if loading.
class ShimmerLoading extends StatefulWidget {
  final bool isLoading;
  final Widget child;

  const ShimmerLoading({
    required this.isLoading,
    required this.child,
    super.key,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_shimmerController != null) {
      _shimmerController!.removeListener(_refresh);
    }

    _shimmerController = Shimmer.of(context)?.shimmerController;

    if (_shimmerController != null) {
      _shimmerController!.addListener(_refresh);
    }
  }

  @override
  void dispose() {
    _shimmerController?.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (widget.isLoading) {
      setState(() {
        // Update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer information.
    final shimmer = Shimmer.of(context)!;

    if (!shimmer.isSized) {
      // The ancestor Shimmer widget isn't laid
      // out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;

    final gradient = shimmer.gradient;

    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}


// ShaderMask

//   - applies a shader to it's child widget

//   - BlendMode.srcATop replaces the childs painted color with the ShaderMask shader color
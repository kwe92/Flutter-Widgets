import 'package:flutter/material.dart';
import 'package:flutter_widgets/create_shimmer_loading_example/shimmer_provider.dart';

/// Wraps child with ShaderMask if loading.
class ShimmerWrapper extends StatefulWidget {
  final bool isLoading;
  final Widget child;

  const ShimmerWrapper({
    required this.isLoading,
    required this.child,
    super.key,
  });

  @override
  State<ShimmerWrapper> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerWrapper> {
  Listenable? _shimmerController;

  void _notifyWidget() {
    if (widget.isLoading) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final shimmer = ShimmerProvider.of(context)!;

    if (!shimmer.isSized) {
      // If ancestor Shimmer not painted
      // Return empty box.
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_shimmerController != null) {
      _shimmerController!.removeListener(_notifyWidget);
    }

    _shimmerController = ShimmerProvider.of(context)?.shimmerController;

    if (_shimmerController != null) {
      _shimmerController!.addListener(_notifyWidget);
    }
  }

  @override
  void dispose() {
    _shimmerController?.removeListener(_notifyWidget);
    super.dispose();
  }
}


// ShaderMask

//   - applies a shader to it's child widget

//   - BlendMode.srcATop replaces the childs painted color with the ShaderMask shader color
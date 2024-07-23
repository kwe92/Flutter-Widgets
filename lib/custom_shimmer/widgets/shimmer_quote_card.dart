import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/custom_shimmer/widgets/custom_shader_mask.dart';

class ShimmerQuoteCard extends StatefulWidget {
  final LinearGradient linearGradient;
  const ShimmerQuoteCard({required this.linearGradient, super.key});

  @override
  State<ShimmerQuoteCard> createState() => _ShimmerQuoteCardState();
}

// ? Note: SingleTickerProviderStateMixin mixin required to pass as vsync
class _ShimmerQuoteCardState extends State<ShimmerQuoteCard> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  // updates the state of the widget similar to notifyListeners

  // void _refresh() {
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));

    // notify wideget of change in animation controller value

    //? _shimmerController.addListener(_refresh);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _shimmerController,
        builder: (context, _) {
          return Container(
            width: double.maxFinite,
            height: 200,
            padding: const EdgeInsets.only(left: 12, top: 16),
            decoration: const BoxDecoration(
              color: Color(0xff2b2c2f),
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                  height: 10,
                  child: SvgPicture.asset(
                    "/Users/kwe/flutter-projects/MVVM-Example-App/mvvm_example_app/assets/left-quotation-mark.svg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonShaderMask(
                        gradient: gradient,
                        child: Container(
                          width: double.infinity,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CommonShaderMask(
                        gradient: gradient,
                        child: Container(
                          width: double.infinity,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CommonShaderMask(
                        gradient: gradient,
                        child: Container(
                          width: 180,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 24),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CommonShaderMask(
                      gradient: gradient,
                      child: Container(
                        width: 80,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        tileMode: widget.linearGradient.tileMode,
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );

  @override
  void dispose() {
    // anything that needs to be disposed should be disposed or removed BEFORE super.dispose() is called
    _shimmerController.dispose();
    //? _shimmerController.removeListener(_refresh);
    super.dispose();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}


// Updating Animation / Controller State Within a Stateful Widget

//   Option 1

//     - add a listener to the controller within init state

//     - the listener should call setState to rerender the U.I. each time the controller value changes

//     = dispose of the controller when you are finished

//   Option 2

//     - pass controller (technically anything that extends Listenable) to an AnimationBuilder

//     - Let AnimmationBuilder handler rebuilding the U.I. and disposing controller


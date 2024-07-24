import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/custom_shimmer/models/quote.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/shimmer_circle.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/shimmer_container.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmerWidgets/shimmer_text.dart';
import 'package:flutter_widgets/custom_shimmer/shimerWrapper/shimmer_wrapper.dart';
import 'package:flutter_widgets/custom_shimmer/shimmer_example_2/shimmer_example_view_model.dart';
import 'package:provider/provider.dart';

const darkModeShimmerColor = Color(0xff252525);

class ExampleShimmerAnimationv2 extends StatelessWidget {
  const ExampleShimmerAnimationv2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xff222222),
        title: const Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<ShimmerExampleViewModel>(builder: (context, ShimmerExampleViewModel viewModel, _) {
        return Padding(
          padding: const EdgeInsets.only(left: 48, right: 16),
          child: QuoteCard(quote: _quote),
        );
      }),
      floatingActionButton: Consumer<ShimmerExampleViewModel>(builder: (context, ShimmerExampleViewModel viewModel, _) {
        return FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          shape: const CircleBorder(),
          onPressed: () => viewModel.setBusy(!viewModel.isBusy),
          child: Icon(viewModel.isBusy ? Icons.hourglass_full : Icons.hourglass_bottom),
        );
      }),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({required this.quote, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ShimmerExampleViewModel>();
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
            child: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/left-quotation-mark.svg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: !viewModel.isBusy
                ? Text(
                    quote.quote,
                    maxLines: 5,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                // ? Shimmer Examples

                // : ShimmerCircle(),

                : ShimmerLines(
                    // baseColor: darkModeShimmerColor,
                    // highlightColor: Colors.grey.shade800,
                    // baseColor: Colors.green,
                    // highlightColor: Colors.lightBlue,
                    ),

            // : const ShimmerContainer(
            //     highlightTilt: HighlightTilt.left,
            //     // baseColor: Colors.green,
            //     // highlightColor: Colors.lightBlue,
            //     width: double.maxFinite,
            //     height: 100,
            //   ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 24),
            child: Align(
              alignment: Alignment.bottomRight,
              child: !viewModel.isBusy
                  ? Text(
                      quote.author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const ShimmerText(
                      // highlightTilt: HighlightTilt.left,
                      width: 80,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerLines extends StatelessWidget {
  // TODO: figure out why longer lines will not tilt
  final Color? baseColor;

  final Color? highlightColor;

  final HighlightTilt? tilt;

  const ShimmerLines({
    this.baseColor,
    this.highlightColor,
    this.tilt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerText(
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
        const SizedBox(height: 16),
        ShimmerText(
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
        const SizedBox(height: 16),
        ShimmerText(
          width: 180,
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
      ],
    );
  }
}

final _quote = Quote(
  author: "Marcus Aurelius",
  quote: "Begin - to begin is half the work, let half still remain; again begin this, and thou wilt have finished.",
);

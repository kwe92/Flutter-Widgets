import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/models/quote.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/widgets/quote_card.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/widgets/shimmer_quote_card.dart';

class ExampleShimmerAnimation extends StatefulWidget {
  const ExampleShimmerAnimation({super.key});

  @override
  State<ExampleShimmerAnimation> createState() => _ExampleShimmerAnimationState();
}

class _ExampleShimmerAnimationState extends State<ExampleShimmerAnimation> {
  bool _isBusy = true;

  void setBusy(bool isBusy) {
    setState(() {
      _isBusy = isBusy;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  ! Note: Future.delayed only present for delay simulation
    final future = Future.delayed(const Duration(seconds: 10));

    future.then((_) => setBusy(false));

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
      body: Padding(
        padding: const EdgeInsets.only(left: 48, right: 16),
        child: !_isBusy
            ? QuoteCard(quote: _quote)
            : ShimmerQuoteCard(
                linearGradient: _shimmerGradient,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        shape: const CircleBorder(),
        onPressed: () => setBusy(!_isBusy),
        child: Icon(_isBusy ? Icons.hourglass_full : Icons.hourglass_bottom),
      ),
    );
  }
}

final _shimmerGradient = LinearGradient(
  colors: [
    Colors.grey.shade300,
    Colors.grey.shade100,
    Colors.grey.shade300,

    // Color(0xFFEBEBF4),
    // Color(0xFFF4F4F4),
    // Color(0xFFEBEBF4),

    // Colors.orange,
    // Colors.blue,
    // Colors.orange,
  ],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

final _quote = Quote(
  author: "Marcus Aurelius",
  quote: "Begin - to begin is half the work, let half still remain; again begin this, and thou wilt have finished.",
);

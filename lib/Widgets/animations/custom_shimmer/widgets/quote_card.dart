import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({required this.quote, super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              quote.quote,
              maxLines: 5,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 24),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                quote.author,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

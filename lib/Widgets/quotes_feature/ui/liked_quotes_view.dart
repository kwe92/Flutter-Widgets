import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/quotes_view_model.dart';
import 'package:provider/provider.dart';

class LikedQuotesView extends StatelessWidget {
  const LikedQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<QuotesViewModel>();

    print("model.likedQuotes.length == 0: ${model.likedQuotes.length == 0}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Liked Quotes"),
        const SizedBox(height: 24),
        model.likedQuotes.length == 0
            ? const Text(
                "Try to find your inspiration...",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: model.likedQuotes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      margin: EdgeInsets.only(
                        left: 24,
                        top: 24,
                        right: 24,
                        bottom: model.likedQuotes.length - 1 == index ? 24 : 0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff1d2530),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            model.likedQuotes[index].quote,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.ios_share,
                                size: 26,
                                color: Colors.blue.withOpacity(0.60),
                              ),
                              Text(
                                model.likedQuotes[index].author,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              IconButton(
                                onPressed: () => model.setLikedForQuote(model.likedQuotes[index]),
                                icon: Icon(
                                  model.likedQuotes[index].isLiked ? Icons.favorite : Icons.favorite_outline,
                                  size: 26,
                                  color: Colors.red.withOpacity(0.60),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}

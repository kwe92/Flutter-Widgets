import 'package:flutter_widgets/Widgets/quotes_feature/model/quote.dart';

class QuoteImp extends Quote {
  QuoteImp({
    required super.author,
    required super.quote,
    required super.isLiked,
  });

  @override
  Map<String, dynamic> toJSON() => {
        "author": author,
        "quote": quote,
      };

  factory QuoteImp.fromJSON(Map<String, dynamic> json) => QuoteImp(
        author: json["a"],
        quote: json["q"],
        isLiked: json["is_liked"],
      );

  @override
  String toString() => "Quote(author: $author, quote: $quote, isLiked: $isLiked)";
}

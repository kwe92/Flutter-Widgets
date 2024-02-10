import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/model/quote.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/model/quote_imp.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/services/api_service.dart';

final zenQuotesService = ZenQuotesApiService();

class ZenQuotesApiService extends ApiService with ChangeNotifier {
  List<Quote> quotes = [];

  Future<void> fetchRandomQuotes() async {
    final response = await get(Endpoint.randomQuotes50.path);

    if (response.statusCode == 200) {
      // print(response.body);

      quotes = [
        for (Map<String, dynamic> quote in jsonDecode(response.body))
          () {
            quote.addAll({"is_liked": false});
            return QuoteImp.fromJSON(quote);
          }()
      ];

      print(quotes);

      notifyListeners();
    }
  }
}

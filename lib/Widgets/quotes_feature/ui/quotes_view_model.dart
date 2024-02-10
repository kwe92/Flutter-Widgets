import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/model/quote.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/services/zen_quotes_api_service.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/liked_quotes_view.dart';

class QuotesViewModel extends ChangeNotifier {
  final pageController = PageController(viewportFraction: 1);

  // List<Quote> get quotes => zenQuotesService.quotes.where((quote) => quote.isLiked == false).toList();

  List<Quote> get quotes => zenQuotesService.quotes;

  List<Quote> get likedQuotes => zenQuotesService.quotes.where((quote) => quote.isLiked == true).toList();

  bool _isBusy = false;

  int _selectedIndex = 0;

  bool get isBusy => _isBusy;

  int get selectedIndex => _selectedIndex;

  List<Widget> widgetOptions = <Widget>[
    const SizedBox(),
    const LikedQuotesView(),
    // const Text(
    //   'Index 1: Liked Quotes',
    //   style: TextStyle(color: Colors.white),
    // ),
    const Text(
      'Index 2: Journal',
      style: TextStyle(color: Colors.white),
    ),
  ];

  QuotesViewModel() {
    initialize();
  }

  void setBusy(bool busy) {
    _isBusy = busy;
    notifyListeners();
  }

  Future<void> initialize() async {
    setBusy(true);
    await getRandomQuotes();
    setBusy(false);

    print("\n\nQuotes from QuotesViewModel: $quotes");
  }

  Future<void> getRandomQuotes() async => zenQuotesService.fetchRandomQuotes();

  void setLikedForQuote(Quote quote) {
    quote.isLiked = !quote.isLiked;
    notifyListeners();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}

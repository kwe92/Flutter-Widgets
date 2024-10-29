import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/liked_quotes_view.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/quotes_view.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/without_framework/ui/journal_view.dart';

class ScaffoldNavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<Widget> widgetOptions = <Widget>[
    const JournalEntryView(),
    const QuotesView(),
    const LikedQuotesView(),
  ];

  void onItemTapped(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}

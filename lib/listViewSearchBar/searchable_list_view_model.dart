// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

// TODO: refact to not be static

class SearchableListViewModel extends ChangeNotifier {
  static var _items = List<String>.generate(10000, (index) => 'item: ${index + 1}');

  List<String> _queriedItems = _items;

  String _query = '';

  String get query => _query;

  List<String> get queriedItems => _queriedItems;

  void onQueryItems(String query) {
    _setQuery(query);
    _queriedItems = _filterItems(query);
    notifyListeners();
  }

  void clearQueriedItems() {
    _queriedItems = _items;
    notifyListeners();
  }

  void _setQuery(String query) {
    _query = query;
    notifyListeners();
  }

  List<String> _filterItems(String query) => _items
      .where(
        (item) => item.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();
}

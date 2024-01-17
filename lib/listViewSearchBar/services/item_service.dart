import 'package:flutter/material.dart';

class ItemService extends ChangeNotifier {
  static List<String> _unfilteredItems = [];

  List<String> _items = [];

  List<String> get items => _items;

  /// simulate API call fetching data from a remote database.
  Future<void> fetchItems() async {
    await Future.delayed(
      const Duration(seconds: 1, milliseconds: 500),
    );

    _unfilteredItems = List<String>.generate(10000, (index) => 'item: ${index + 1}');

    _items = _unfilteredItems;

    notifyListeners();
  }

  void clearFilteredItems() {
    _items = _unfilteredItems;

    notifyListeners();
  }

  void filterItems(String query) {
    _items = _filter(query);

    notifyListeners();
  }

  List<String> _filter(String query) => _unfilteredItems
      .where(
        (item) => item.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();
}

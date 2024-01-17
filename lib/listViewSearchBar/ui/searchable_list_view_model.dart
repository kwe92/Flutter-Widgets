// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_widgets/listViewSearchBar/services/services.dart';

class SearchableListViewModel extends ChangeNotifier {
  bool _isLoading = false;

  String _query = '';

  List<String> get items => itemService.items;

  bool get isLoading => _isLoading;

  String get query => _query;

  SearchableListViewModel() {
    initialize();
  }

  Future<void> initialize() async {
    setLoading(true);

    await itemService.fetchItems();

    setLoading(false);

    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void onQueryItems(String query) {
    _setQuery(query);
    itemService.filterItems(query);
    notifyListeners();
  }

  void clearFilteredItems() {
    itemService.clearFilteredItems();
    notifyListeners();
  }

  void _setQuery(String query) {
    _query = query;
    notifyListeners();
  }
}

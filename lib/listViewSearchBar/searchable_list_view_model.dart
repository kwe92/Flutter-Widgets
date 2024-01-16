// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class SearchableListViewModel extends ChangeNotifier {
  var _items = List<String>.generate(10000, (index) => 'item: $index');

  List<String> get items => _items;
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/item.dart';

final itemService = ItemsService();

class ItemsService with ChangeNotifier {
  List<Item> _items = [];
  List<Item> get items => _items;

  static final singleton = ItemsService._internal();

  ItemsService._internal();

  factory ItemsService() => singleton;

  Future<void> getItems() async {
    await Future.delayed(const Duration(seconds: 2));

    _items = [for (Map<String, dynamic> item in _itemsMap) Item.fromMap(item)];

    notifyListeners();
  }
}

final List<Map<String, dynamic>> _itemsMap = [
  {
    "name": "Pepperoni Pizza",
    "price": 14.99,
    "image_url": "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/pepperoni_pizza.avif",
  },
  {
    "name": "Pepperoni Calzone",
    "price": 7.99,
    "image_url": "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/pepperoni_calzone.avif",
  },
  {
    "name": "Spaghetti and Meatballs",
    "price": 9.99,
    "image_url": "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/spaghetti_and_meatballs.jpg",
  },
];

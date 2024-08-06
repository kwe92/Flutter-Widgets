import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/item.dart';

class Customer {
  final String name;
  final ImageProvider imageProvider;
  List<Item> items;
  double get total => items.fold(0, (prev, next) => prev + next.price);

  Customer({
    required this.name,
    required this.imageProvider,
    List<Item>? items,
  }) : items = items ?? [];
}

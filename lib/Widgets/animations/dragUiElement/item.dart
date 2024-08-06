import 'dart:convert';

import 'package:flutter/material.dart';

class Item {
  final String name;
  final double price;
  final ImageProvider imageProvider;

  const Item({
    required this.name,
    required this.price,
    required this.imageProvider,
  });

  @override
  String toString() => 'Item(name: $name, price: $price, imageProvider: $imageProvider)';

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      imageProvider: Image.asset(map['image_url'] ?? '').image,
    );
  }

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}

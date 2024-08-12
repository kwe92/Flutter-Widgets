import 'package:flutter/material.dart';

@immutable
class Location {
  final String name;
  final String place;
  final String imageUrl;

  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });
}

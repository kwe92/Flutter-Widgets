import 'package:flutter/material.dart';

class SliderColorGradientModel extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  void setValue(double value) {
    _value = value;
    notifyListeners();
  }
}

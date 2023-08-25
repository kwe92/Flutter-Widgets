import 'package:flutter/material.dart';

class CheckBoxModel extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void onChecked() {
    _isChecked = !_isChecked;
    print("onChecked: $_isChecked");
    notifyListeners();
  }
}

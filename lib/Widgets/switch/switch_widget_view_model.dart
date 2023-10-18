import 'package:flutter/material.dart';

class SwitchWidgetViewModel extends ChangeNotifier {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  void toggle(bool value) {
    _isToggled = value;
    debugPrint("SwitchWidgetViewModel toggled, value is now: $isToggled");
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';

class ShimmerExampleViewModel with ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  void setBusy(bool isBusy) {
    _isBusy = isBusy;
    notifyListeners();
  }
}

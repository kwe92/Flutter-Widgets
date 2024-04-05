import 'package:flutter/widgets.dart';

class ExtendedChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setBusy(bool isBusy) {
    _isLoading = isBusy;
    notifyListeners();
  }
}

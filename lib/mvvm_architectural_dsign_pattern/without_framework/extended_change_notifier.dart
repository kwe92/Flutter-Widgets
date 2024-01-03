// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

/// ChangeNotifier with added loading state handling.
class ExtendedChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  /// Represents the loading state of the ViewModel.
  get isLoading => _isLoading;

  /// Sets the loading state of the ViewModel, calls notifiy listeners.
  void setIsLoading(bool isBusy) {
    _isLoading = isBusy;
    notifyListeners();
  }

  Future<T> runBusyFuture<T>(Future<T> bustFuture) async {
    setIsLoading(true);
    T futureValue = await () async {
      return await bustFuture;
    }();
    setIsLoading(false);

    return futureValue;
  }
}

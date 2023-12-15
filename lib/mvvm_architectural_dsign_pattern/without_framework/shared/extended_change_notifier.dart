// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

/// ChangeNotifier with added loading state handling.
class ExtendedChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;

  /// Represents the loading state of the ViewModel.
  get isLoading => _isLoading;

  ExtendedChangeNotifier();

  /// Set the loading state of the ViewModel, calls notifiy listeners.
  void setIsLoading(bool isBusy) {
    _isLoading = isBusy;
    notifyListeners();
  }
}

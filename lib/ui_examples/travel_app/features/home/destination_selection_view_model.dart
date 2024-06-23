import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/model/destination.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/services/destination_service.dart';

class DestinationSelectionViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<Destination> get destinations => destinationService.destinations;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<List<Destination>> getData() async => await destinationService.fetchData();
}

// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/flutterAppBadger/services/services.dart';
import 'package:stacked/stacked.dart';

class FlutterAppBadgerViewModel extends ReactiveViewModel {
  int _count = 0;

  int get count => _count;

  String get appBadgeSupported => flutterAppBadgerService.appBadgeSupported;

  @override
  List<ListenableServiceMixin> get listenableServices => [flutterAppBadgerService];

  void addBadge() {
    //? increment example
    _count += 1;

    //? hard coded example
    // _count = 4892;

    flutterAppBadgerService.addBadge(_count);
    notifyListeners();
  }

  void removeBadge() {
    _count = 0;
    flutterAppBadgerService.removeBadge();
    notifyListeners();
  }
}

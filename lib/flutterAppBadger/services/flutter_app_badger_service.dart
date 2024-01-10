import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:stacked/stacked.dart';

class FlutterAppBadgerService with ListenableServiceMixin {
  FlutterAppBadgerService();

  String _appBadgeSupported = 'Unknown';

  String get appBadgeSupported => _appBadgeSupported;

  Future<void> initPlatformState(bool isMounted) async {
    String appBadgeSupport;

    debugPrint('initPlatformState called');
    debugPrint('isMounted $isMounted');

    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();

      debugPrint('res $res');

      if (res) {
        appBadgeSupport = 'Supported';
      } else {
        appBadgeSupport = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupport = 'Failed to get badge support.';
    }

    // If widget removed from widget tree while asynchronous platform
    // message in flight, discard reply rather than calling
    // update a non-existent appearance.
    if (!isMounted) return;

    _appBadgeSupported = appBadgeSupport;

    notifyListeners();
  }

  void addBadge(int count) {
    try {
      FlutterAppBadger.updateBadgeCount(count);
      debugPrint('current home icon badge count: $count');
    } catch (e) {
      debugPrint('exception in updateBadgeCount: $e');
    }
  }

  void removeBadge() => FlutterAppBadger.removeBadge();
}

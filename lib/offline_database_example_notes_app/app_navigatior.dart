import 'package:flutter/material.dart';

class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  AppNavigator._();

  static Future<void> push(Widget view) async => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => view,
        ),
      );
}

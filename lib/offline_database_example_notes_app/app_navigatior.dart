import 'package:flutter/material.dart';

class AppNavigatior {
  static final navigatorKey = GlobalKey<NavigatorState>();
  AppNavigatior._();

  static Future<void> push(Widget view) async => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => view,
        ),
      );
}

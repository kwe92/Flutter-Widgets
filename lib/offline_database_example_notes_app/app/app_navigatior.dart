import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/widget_keys.dart';

class AppNavigator {
  static var navigatorKey = WidgetKey.navigatorKey;
  AppNavigator._();

  static Future<void> push(Widget view) async => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => view,
        ),
      );

  static Future<void> pop() async => navigatorKey.currentState!.pop();
}

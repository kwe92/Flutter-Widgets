import 'package:flutter/material.dart';

class WidgetKey {
  const WidgetKey._();
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}

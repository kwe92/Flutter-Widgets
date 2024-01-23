import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  // TODO: Review
  static Future<void> push(BuildContext context, Widget Function(BuildContext context) builder) async => await Navigator.of(context).push(
        MaterialPageRoute(
          builder: builder,
        ),
      );
}

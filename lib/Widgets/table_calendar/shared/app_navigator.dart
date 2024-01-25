import 'package:flutter/material.dart';

// !! COULD BE USED IN ANY APP!!

// maybe write an article about?

class AppNavigator {
  AppNavigator._();

  // TODO: Review
  static Future<void> push(BuildContext context, Widget Function(BuildContext context) builder) async => await Navigator.of(context).push(
        MaterialPageRoute(
          builder: builder,
        ),
      );
}

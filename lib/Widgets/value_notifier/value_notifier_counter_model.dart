// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ValueNotifierCounterModel {
  static ValueNotifier<int> countNotifier = ValueNotifier(0);

  static void increment() => countNotifier.value++;

  static void decrement() =>
      countNotifier.value > 0 ? countNotifier.value-- : null;
}

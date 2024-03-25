import 'dart:math';

import 'package:flutter_widgets/fl_charts/mood.dart';
import 'package:intl/intl.dart';

class GetRandom {
  GetRandom._();

  static final rng = Random();

  /// exclusive range
  static int randRangeInt({int min = 0, required int max}) => rng.nextInt(max - min) + min;
}

String getRandomMood() {
  final int value = GetRandom.randRangeInt(min: 1, max: 6);

  return switch (value) {
    1 => MoodType.awesome.text,
    2 => MoodType.happy.text,
    3 => MoodType.okay.text,
    4 => MoodType.bad.text,
    5 => MoodType.terrible.text,
    int() => "",
  };
}

DateTime getRandomDateTime() {
  final int value = GetRandom.randRangeInt(min: 1, max: 31);

  return DateTime.now().add(Duration(days: -value));
}

String removeTimeStamp(DateTime date) => DateFormat("yyyy-MM-dd").format(date);

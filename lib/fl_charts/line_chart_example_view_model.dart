// ignore_for_file: prefer_final_fields

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/fl_charts/mood.dart';
import 'package:flutter_widgets/fl_charts/moods_service.dart';

class LineChartSampleViewModel extends ChangeNotifier {
  double _maxX = 31;

  List<WeightedMood> _weightedMoods = moodsService.weightedMoodData;

  double get maxX => _maxX;

  List<WeightedMood> get weightedMoods => _weightedMoods;

  Map get _groupByCreatedAt => groupBy([for (var mood in _weightedMoods) mood.toMap()], (Map obj) => DateTime.parse(obj['createdAt']).day);

  List<Map<int, double>> get groupedMoodsData => [for (var moodMap in _groupByCreatedAt.entries) _getMoodMetric(moodMap)]
      .sorted((moodA, moodB) => moodA.entries.toList()[0].key.compareTo(moodB.entries.toList()[0].key));

  LineChartSampleViewModel();

  void filterMoodsData(MoodFilter filterBy) {
    switch (filterBy) {
      case MoodFilter.week:
        _maxX = 7;
        _weightedMoods =
            moodsService.weightedMoodData.where((mood) => (mood.createdAt.difference(DateTime.now()).inDays).abs() <= 7).toList();
        notifyListeners();
        break;

      case MoodFilter.month:
        _maxX = 31;

        _weightedMoods =
            moodsService.weightedMoodData.where((mood) => (mood.createdAt.difference(DateTime.now()).inDays).abs() <= 31).toList();
        notifyListeners();
        break;

      case MoodFilter.year:
        _maxX = 365;

        _weightedMoods =
            moodsService.weightedMoodData.where((mood) => (mood.createdAt.difference(DateTime.now()).inDays).abs() <= 365).toList();
        notifyListeners();
        break;
    }
  }

  static Map<int, double> _getMoodMetric(MapEntry moodMap) {
    double value = 0;
    int count = 0;
    for (Map<String, dynamic> moodMap in moodMap.value) {
      value += moodMap["weight"];
      count++;
    }
    return {moodMap.key: double.parse((value / count).toStringAsPrecision(2))};
  }
}

enum MoodFilter {
  week,
  month,
  year;
}

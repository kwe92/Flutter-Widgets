// ignore_for_file: prefer_final_fields

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/fl_charts/mood.dart';
import 'package:flutter_widgets/fl_charts/moods_service.dart';

class LineChartSampleViewModel extends ChangeNotifier {
  double _maxX = 30;

  List<WeightedMood> _weightedMoods = moodsService.weightedMoodData;

  double get maxX => _maxX;

  List<WeightedMood> get weightedMoods => _weightedMoods;

  Map get _groupByCreatedAt => groupBy(
      // TODO: fix issue with the last 90 days
      [for (WeightedMood mood in _weightedMoods) mood.toMap()],
      (Map<String, dynamic> moodMap) => moodMap['createdAt']);

  List<Map> get groupedMoodsData => [for (var moodMap in _groupByCreatedAt.entries) _getMoodMetric(moodMap)]
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
        _maxX = 30;

        _weightedMoods =
            moodsService.weightedMoodData.where((mood) => (mood.createdAt.difference(DateTime.now()).inDays).abs() <= 30).toList();
        notifyListeners();
        break;

      case MoodFilter.threeMonths:
        _maxX = 90;

        _weightedMoods =
            moodsService.weightedMoodData.where((mood) => (mood.createdAt.difference(DateTime.now()).inDays).abs() <= 90).toList();

        print(_weightedMoods.length);
        notifyListeners();
        break;
    }
  }

  static Map _getMoodMetric(MapEntry moodMap) {
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
  threeMonths;
}

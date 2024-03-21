import 'package:flutter/material.dart';
import 'package:flutter_widgets/fl_charts/mood.dart';
import 'package:flutter_widgets/fl_charts/utils.dart';

final moodsService = MoodsService();

class MoodsService extends ChangeNotifier {
  List<WeightedMood> _weightedMoodData = [];

  List<WeightedMood> get weightedMoodData => _weightedMoodData;

  MoodsService() {
    _weightedMoodData = [
      for (int i = 0; i < 200; i++)
        WeightedMood(
          mood: getRandomMood(),
          createdAt: getRandomDateTime(),
        )
    ];
  }
}

import 'package:collection/collection.dart';
import 'package:flutter_widgets/fl_charts/mood.dart';
import 'package:flutter_widgets/fl_charts/utils.dart';

List<WeightedMood> weightedMoodData = [
  for (int i = 0; i < 30; i++)
    WeightedMood(
      mood: getRandomMood(),
      createdAt: getRandomDateTime(),
    )
].sorted(
  (moodA, moodB) => moodA.createdAt.compareTo(moodB.createdAt),
);

import 'dart:convert';

import 'package:intl/intl.dart';

class WeightedMood {
  final String mood;

  final DateTime createdAt;

  double get weight {
    return switch (mood) {
      MoodTypeConst.awesome => 1.0,
      MoodTypeConst.happy => 0.75,
      MoodTypeConst.okay => 0.5,
      MoodTypeConst.bad => 0.25,
      MoodTypeConst.terrible => 0.0,
      String() => 0.0,
    };
  }

  const WeightedMood({
    required this.mood,
    required this.createdAt,
  });

  @override
  String toString() => 'WeightedMood(mood: $mood, createdAt: $createdAt)';

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'createdAt': DateFormat.yMMMMd().format(createdAt),
    };
  }

  factory WeightedMood.fromMap(Map<String, dynamic> map) {
    return WeightedMood(
      mood: map['mood'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightedMood.fromJson(String source) => WeightedMood.fromMap(json.decode(source));
}

enum MoodType {
  awesome("awesome"),

  happy("happy"),

  okay("okay"),

  bad("bad"),

  terrible("terrible");

  final String text;

  const MoodType(this.text);
}

class MoodTypeConst {
  MoodTypeConst._();
  static const awesome = "awesome";

  static const happy = "happy";

  static const okay = "okay";

  static const bad = "bad";

  static const terrible = "terrible";
}

// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';

final journalDateService = JournalDateService();

class JournalDateService extends ChangeNotifier {
  List<DateTime> _updatedDates = [
    DateTime.now().add(const Duration(days: -82)),
    DateTime.now().add(const Duration(days: -78)),
    DateTime.now().add(const Duration(days: -74)),
    DateTime.now().add(const Duration(days: -70)),
    DateTime.now().add(const Duration(days: -66)),
    DateTime.now().add(const Duration(days: -62)),
    DateTime.now().add(const Duration(days: -58)),
    DateTime.now().add(const Duration(days: -54)),
    DateTime.now().add(const Duration(days: -50)),
    DateTime.now().add(const Duration(days: -46)),
    DateTime.now().add(const Duration(days: -42)),
    DateTime.now().add(const Duration(days: -38)),
    DateTime.now().add(const Duration(days: -32)),
    DateTime.now().add(const Duration(days: -28)),
    DateTime.now().add(const Duration(days: -24)),
    DateTime.now().add(const Duration(days: -20)),
    DateTime.now().add(const Duration(days: -16)),
    DateTime.now().add(const Duration(days: -12)),
    DateTime.now().add(const Duration(days: -8)),
    DateTime.now().add(const Duration(days: -4)),
    DateTime.now()
  ];

  List<DateTime> get updatedDates => _updatedDates;

  DateTime get maxDate => getMaxDate(_updatedDates);

  DateTime get minDate => getMinDates(_updatedDates);
}

// TODO: Review
DateTime getMaxDate(List<DateTime> dates) => dates.reduce((a, b) => a.isAfter(b) ? a : b);

DateTime getMinDates(List<DateTime> dates) => dates.reduce((a, b) => b.isAfter(a) ? a : b);

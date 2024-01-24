// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExampleViewModel extends ChangeNotifier {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? _focusedDay;

  DateTime? _selectedDay;

  DateTime? get focusedDay => _focusedDay;

  DateTime? get selectedDay => _selectedDay;

  CalendarFormat get calendarFormat => _calendarFormat;

  TableBasicsExampleViewModel({required DateTime focusedDay}) {
    initialize(focusedDay);
  }

  void initialize(DateTime focusedDay) {
    _focusedDay = focusedDay;

    setSelectedDay(focusedDay);

    notifyListeners();
  }

  void setCalendarFormat(CalendarFormat format) {
    _calendarFormat = format;
    notifyListeners();
  }

  void setFocusDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  void setSelectedDay(DateTime selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  void setFocusDayWithoutNotification(DateTime focusedDay) => _focusedDay = focusedDay;
}

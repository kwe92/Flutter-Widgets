// ignore_for_file: prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:flutter_widgets/Widgets/table_calendar/event_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class TableEventsExampleViewModel extends ChangeNotifier {
  late List<Event> _selectedEvents;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  DateTime? _rangeStart;

  DateTime? _rangeEnd;

  List<Event> get selectedEvents => _selectedEvents;

  CalendarFormat get calendarFormat => _calendarFormat;

  RangeSelectionMode get rangeSelectionMode => _rangeSelectionMode;

  DateTime get focusedDay => _focusedDay;

  DateTime? get selectedDay => _selectedDay;

  DateTime? get rangeStart => _rangeStart;

  DateTime? get rangeEnd => _rangeEnd;

  TableEventsExampleViewModel({required DateTime focusedDay}) {
    initialize(focusedDay);
  }

  void initialize(DateTime focusedDay) {
    _focusedDay = focusedDay;

    _selectedDay = _focusedDay;

    _selectedEvents = getEventsForDay(_selectedDay!);

    notifyListeners();
  }

  void setSelectedEvents(List<Event> selectedEvents) {
    _selectedEvents = selectedEvents;
    notifyListeners();
  }

  void setCalendarFormat(CalendarFormat calendarFormat) {
    _calendarFormat = calendarFormat;
    notifyListeners();
  }

  void setRangeSelectionMode(RangeSelectionMode rangeSelectionMode) {
    _rangeSelectionMode = rangeSelectionMode;
    notifyListeners();
  }

  void setFocusedDay(DateTime focusedDay) {
    _focusedDay = focusedDay;
    notifyListeners();
  }

  void setSelectedDay(DateTime? selectedDay) {
    _selectedDay = selectedDay;
    notifyListeners();
  }

  void setRangeStart(DateTime? rangeStart) {
    _rangeStart = rangeStart;
    notifyListeners();
  }

  void setRangeEnd(DateTime? rangeEnd) {
    _rangeEnd = rangeEnd;
    notifyListeners();
  }

  List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;

      _selectedEvents = getEventsForDay(selectedDay);
    }

    notifyListeners();
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _selectedDay = null;
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
    _rangeSelectionMode = RangeSelectionMode.toggledOn;

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents = getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents = getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents = getEventsForDay(end);
    }

    notifyListeners();
  }
}

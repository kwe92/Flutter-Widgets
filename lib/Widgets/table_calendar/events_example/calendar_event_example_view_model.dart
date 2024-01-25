// ignore_for_file: prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:flutter_widgets/Widgets/table_calendar/shared/event_utils.dart';
import 'package:flutter_widgets/Widgets/table_calendar/shared/journal_date_service.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:table_calendar/table_calendar.dart';

class TableEventsExampleViewModel extends ChangeNotifier {
  late List<BaseJournalEntry> _selectedEvents;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  DateTime? _rangeStart;

  DateTime? _rangeEnd;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<BaseJournalEntry> get selectedEvents => _selectedEvents;

  CalendarFormat get calendarFormat => _calendarFormat;

  RangeSelectionMode get rangeSelectionMode => _rangeSelectionMode;

  DateTime get focusedDay => _focusedDay;

  DateTime? get selectedDay => _selectedDay;

  DateTime? get rangeStart => _rangeStart;

  DateTime? get rangeEnd => _rangeEnd;

  TableEventsExampleViewModel({required DateTime focusedDay}) {
    initialize(focusedDay);
  }

  Future<void> initialize(DateTime focusedDay) async {
    setIsLoading(true);
    _focusedDay = focusedDay;

    _selectedDay = _focusedDay;

    await journalDateService.fakeApiCallToGetAllEntries();

    _selectedEvents = getEventsForDay(_selectedDay!);

    setIsLoading(false);
  }

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setSelectedEvents(List<BaseJournalEntry> selectedEvents) {
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

  List<BaseJournalEntry> getEventsForDay(DateTime day) {
    // Implementation example
    return journalDateService.journalEntries.where((entry) => isSameDay(entry.updatedAt, day)).toList();
  }

  List<BaseJournalEntry> getEventsForRange(DateTime start, DateTime end) {
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

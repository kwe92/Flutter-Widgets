import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/table_calendar/basic_example/basic_calendar_view_model.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBasicsExampleView extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;

  const TableBasicsExampleView({
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Basics'),
      ),
      body: ChangeNotifierProvider<TableBasicsExampleViewModel>(
        create: (context) => TableBasicsExampleViewModel(focusedDay: focusedDay),
        builder: (context, _) {
          final model = Provider.of<TableBasicsExampleViewModel>(context);

          return TableCalendar(
            firstDay: firstDay,
            lastDay: lastDay,
            focusedDay: model.focusedDay!,
            calendarFormat: model.calendarFormat,
            // Use `selectedDayPredicate` to determine which day is currently selected.
            // If this returns true, then `day` will be marked as selected.
            // Using `isSameDay` is recommended to disregard
            // the time-part of compared DateTime objects.
            selectedDayPredicate: (day) => isSameDay(model.selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(model.selectedDay, selectedDay)) {
                model.setSelectedDay(selectedDay);
                model.setFocusDay(focusedDay);
              }
            },
            onFormatChanged: (format) {
              if (model.calendarFormat != format) {
                model.setCalendarFormat(format);
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              model.setFocusDayWithoutNotification(focusedDay);
            },
          );
        },
      ),
    );
  }
}

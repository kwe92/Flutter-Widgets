import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/table_calendar/app_navigator.dart';
import 'package:flutter_widgets/Widgets/table_calendar/basic_calendar_view.dart';
import 'package:flutter_widgets/Widgets/table_calendar/date_tile.dart';
import 'package:flutter_widgets/Widgets/table_calendar/journal_date_service.dart';
import 'package:gap/gap.dart';

class JournalDateView extends StatelessWidget {
  const JournalDateView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Working With Table Calendar'),
        ),
        body: Column(
          children: [
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: journalDateService.updatedDates.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () async => await AppNavigator.push(
                    context,
                    (context) => TableBasicsExampleView(
                      firstDay: journalDateService.minDate,
                      lastDay: journalDateService.maxDate,
                      focusedDay: journalDateService.updatedDates[index],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: index != journalDateService.updatedDates.length - 1 ? 12 : 0),
                    child: DateTile(updatedAt: journalDateService.updatedDates[index]),
                  ),
                ),
              ),
            ),
            const Gap(16),
          ],
        ),
      );
}

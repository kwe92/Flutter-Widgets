import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/table_calendar/events_example/calendar_event_example_view_model.dart';
import 'package:flutter_widgets/Widgets/table_calendar/shared/journal_date_service.dart';
import 'package:flutter_widgets/Widgets/table_calendar/widgets/journal_content.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TableEventsExampleView extends StatelessWidget {
  const TableEventsExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TableEventsExampleViewModel(focusedDay: DateTime.now()),
        builder: (context, child) {
          final model = Provider.of<TableEventsExampleViewModel>(context);

          return model.isLoading
              ? circleLoader
              : Column(
                  children: [
                    Expanded(
                      child: NestedScrollView(
                        floatHeaderSlivers: true,
                        headerSliverBuilder: (context, _) => [
                          SliverAppBar(
                            toolbarHeight: MediaQuery.of(context).size.height / 2.5,
                            scrolledUnderElevation: 0,
                            automaticallyImplyLeading: false,
                            // floating: required to make SliverAppBar snappable
                            floating: true,
                            // snap: required to make SliverAppBar snappable
                            snap: true,
                            title: TableCalendar<BaseJournalEntry>(
                              daysOfWeekHeight: 24,
                              firstDay: journalDateService.minDate,
                              lastDay: journalDateService.maxDate,
                              focusedDay: model.focusedDay,
                              selectedDayPredicate: (day) => isSameDay(model.selectedDay, day),
                              rangeStartDay: model.rangeStart,
                              rangeEndDay: model.rangeEnd,
                              calendarFormat: model.calendarFormat,
                              rangeSelectionMode: model.rangeSelectionMode,
                              eventLoader: model.getEventsForDay,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              calendarStyle: const CalendarStyle(
                                // Use `CalendarStyle` to customize the UI
                                outsideDaysVisible: false,
                              ),
                              onDaySelected: model.onDaySelected,
                              onRangeSelected: model.onRangeSelected,
                              onFormatChanged: (format) {
                                if (model.calendarFormat != format) {
                                  model.setCalendarFormat(format);
                                }
                              },
                              onPageChanged: (focusedDay) => model.setFocusedDay(focusedDay),
                              calendarBuilders: CalendarBuilders(
                                  //   singleMarkerBuilder: (context, day, event) {
                                  //     return Container(
                                  //       height: 6,
                                  //       width: 6,
                                  //       margin: const EdgeInsets.only(right: 2),
                                  //       color: Colors.orange,
                                  //     );
                                  //   },
                                  //   selectedBuilder: (context, day, focusedDay) {
                                  //     return Container(
                                  //       height: double.maxFinite,
                                  //       width: double.maxFinite,
                                  //       color: Colors.purple,
                                  //       child: Center(child: Text('${day.day}')),
                                  //     );
                                  //   },
                                  ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: Gap(12),
                          )
                        ],
                        body: ListView.builder(
                          itemCount: model.selectedEvents.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 6.0,
                            ),
                            child: JournalContent(
                              onPressed: () {},
                              moodBackgroundColor: Colors.blueGrey,
                              content: model.selectedEvents[index].content!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

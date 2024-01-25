import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/table_calendar/journal_date_view_model.dart';
import 'package:flutter_widgets/Widgets/table_calendar/widgets/journal_entry_card.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class JournalDateView extends StatelessWidget {
  const JournalDateView({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => JournalDateViewModel(),
        builder: (context, child) {
          final model = Provider.of<JournalDateViewModel>(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Working With Table Calendar'),
            ),
            body: model.isLoading
                ? circleLoader
                : Column(
                    children: [
                      const Gap(16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: model.journalEntries.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: index != model.journalEntries.length - 1 ? 12 : 0),
                            child: JournalEntryCard(
                              index: index,
                              journalEntry: model.journalEntries[index],
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
          );
        },
      );
}

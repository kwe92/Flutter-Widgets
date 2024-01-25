import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/table_calendar/widgets/date_tile.dart';
import 'package:flutter_widgets/Widgets/table_calendar/widgets/journal_content.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final int index;
  final BaseJournalEntry journalEntry;

  const JournalEntryCard({
    required this.index,
    required this.journalEntry,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        // TODO: refactor, no need to pass in the index
        padding: EdgeInsets.only(top: index == 0 ? 16 : 0, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateTile(
                  updatedAt: journalEntry.updatedAt!,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            JournalContent(
              onPressed: () {},
              moodBackgroundColor: Colors.blueGrey,
              content: journalEntry.content!,
            ),
          ],
        ),
      );
}

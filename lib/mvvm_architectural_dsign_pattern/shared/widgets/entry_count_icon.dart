import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';
import 'package:provider/provider.dart';

class EntryCountIcon extends StatelessWidget {
  const EntryCountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JournalEntryService>.value(
      value: journalEntryService,
      child: Consumer<JournalEntryService>(
        builder: (BuildContext context, JournalEntryService journalEntryService, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.book_online_outlined),
              const SizedBox(
                width: 6,
              ),
              Text(journalEntryService.journalEntries.length.toString()),
            ],
          );
        },
      ),
    );
  }
}

// TODO: add notes

// ChangeNotifierProvider<JournalEntryService>.value
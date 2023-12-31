// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/services.dart';
import 'package:stacked/stacked.dart';

class JournalEntryViewModelStacked extends ReactiveViewModel {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        journalEntryService,
      ];

  Future<void> initialize() async {
    // set busy state to true and call service to retrieve all entries from API asynchronously then set busy state to false
    await runBusyFuture<void>(journalEntryService.fakeApiCallToGetAllEntries());

    _journalEntries = journalEntryService.journalEntries;
  }
}

// TODO: add comments

// runBusyFuture

// listenableServices

// ReactiveViewModel
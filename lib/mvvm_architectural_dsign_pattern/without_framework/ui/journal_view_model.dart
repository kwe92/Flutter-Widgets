// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/extended_change_notifier.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/services.dart';

class JournalEntryViewModel extends ExtendedChangeNotifier {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  JournalEntryViewModel() {
    // initialization should happen in the ViewModel Class constructor body
    // to not trigger notification events while the view is building
    // similar to onViewModelReady from stacked framework
    _initialize();
  }

  Future<void> _initialize() async {
    // set busy state to true and call service to retrieve all entries from API asynchronously then set busy state to false
    await runBusyFuture(journalEntryService.fakeApiCallToGetAllEntries());

    _journalEntries = journalEntryService.journalEntries;
  }
}

// ViewModel Class (M-V-VM: Model-View-ViewModel Architectural Design Pattern)

//   - the mediator between Model and View classes
//   - provides instances of any required Models consumed by Views
//   - Provides mutable properties that the View observes and reacts to
//   - implements methods that Views can use to manipulate the state of ViewModel properties
//   - private methods can also be implemented within the ViewModel to manipulate its own mutable state
//   - method implementations that manipulate ViewModel state should have notification events
//     at the bottom of the implementation or before return statements within any block {loops, if statements etc}

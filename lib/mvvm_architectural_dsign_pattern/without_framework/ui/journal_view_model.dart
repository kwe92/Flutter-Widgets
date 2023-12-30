// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/extended_change_notifier.dart';

class JournalEntryViewModel extends ExtendedChangeNotifier {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  JournalEntryViewModel() {
    // model initialization should happen in the constructor body of the ViewModel Class
    // as to not trigger notification events while the view is building.
    // seems equivalent to onViewModelReady from the stacked framework
    _initialize();
  }

  Future<void> _initialize() async {
    // set loading state to true notifying the View that the ViewModel is not ready.
    setIsLoading(true);

    // call service to retrieve all entries from API asynchronously
    await journalEntryService.fakeApiCallToGetAllEntries();

    _journalEntries = journalEntryService.journalEntries;
    // set loading state to false notifying the View that the ViewModel is ready to be consumed.
    setIsLoading(false);
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

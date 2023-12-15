// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/models/journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/services/journal_entry_service.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/shared/extended_change_notifier.dart';

class JournalEntryViewModel extends ExtendedChangeNotifier {
  // use a computed variable to listen for state changes in the service class providing deserialized domain data
  List<JournalEntry> get journalEntries => journalEntryService.journalEntries;

  JournalEntryViewModel() {
    // model initialization should happen in the constructor body of the ViewModel
    // as to not trigger notification events while the view is building.

    _initialize();
  }

  Future<void> _initialize() async {
    // set loading state to true to notify the View that the ViewModel is not ready.
    setIsLoading(true);

    // call service to retrieve all entries from API asynchronously
    await journalEntryService.fakeApiCallToGetAllEntries();

    // set loading state to false to notify the View that the ViewModel is ready to be consumed.
    setIsLoading(false);
  }
}
// TODO: add comments

// ViewModel Class

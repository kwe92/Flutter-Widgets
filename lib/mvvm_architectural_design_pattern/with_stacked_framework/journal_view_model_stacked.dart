// ignore_for_file: prefer_final_fields

import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/services/services.dart';
import 'package:stacked/stacked.dart';

class JournalEntryViewModelStacked extends ReactiveViewModel {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  @override
  List<ListenableServiceMixin> get listenableServices => [
        journalEntryService,
      ];

  Future<void> initialize() async {
    //!! TODO: move this cal lto main function
    // set busy state to true and call service to retrieve all entries from API asynchronously then set busy state to false
    await runBusyFuture<void>(journalEntryService.fakeApiCallToGetAllEntries());

    //!! TODO: once fakeApiCallToGetAllEntries has been moved to the main function use a getter derived method to get journal entries from the service
    _journalEntries = journalEntryService.journalEntries;
  }
}

// runBusyFuture

//   - calls setBusy before and after an asynchronous (concurrent) method call
//     for brevity of busy state management

// ReactiveViewModel

//   - a BaseViewModel that can listen to changes of a service that
//     uses ListenableServiceMixin as a mixin

// listenableServices

//   - must be overriden to polymorphically declare what services
//     a ReactiveViewModel wants to listen to


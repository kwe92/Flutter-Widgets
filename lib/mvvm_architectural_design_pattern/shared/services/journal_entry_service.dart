import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/factory/factory.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/models/base_journal_entry.dart';
import 'package:stacked/stacked.dart';

class JournalEntryService extends ChangeNotifier with ListenableServiceMixin {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  /// Represents fake API call to backend retrieving deserialized domain model data.
  Future<void> fakeApiCallToGetAllEntries() async {
    // mimic a really long delay, typical API calls are much faster than this
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    // represents data received from API call response body, typically deserialized from JSON into domain model objects
    // that process is skipped for brevity
    _journalEntries = <BaseJournalEntry>[
      // use AbstractFactory to create new model instances
      AbstractFactory.createJournalEntry(
        entryId: 1001,
        userId: 42,
        content: 'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AbstractFactory.createJournalEntry(
        entryId: 1002,
        userId: 42,
        content:
            'Every kingdom divided against itself is brought to desolation, every city or house divided against itself shall not stand.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AbstractFactory.createJournalEntry(
        entryId: 1003,
        userId: 42,
        content: 'You are a light on a hill that can not be hid.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AbstractFactory.createJournalEntry(
        entryId: 1005,
        userId: 42,
        content: 'Emptiness is calmness, calmness is emptiness.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AbstractFactory.createJournalEntry(
        entryId: 1005,
        userId: 42,
        content: 'all is opinion.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    notifyListeners();
  }
}

// ChangeNotifier

//   - can be extended or mixed in to provide a change notification event API
//   - used to notify clients that a value has changed so they should rebuild or update
//   - can be used to implement a M-V-VM architectural design pattern as it requires a notification event API implementation of some sort

// Service Class

//   - "Create a service and call it in your ViewModel"
//   - Remove business logic (actual work) from your ViewModel 
//     so it can focus soley on managing the state for the View
//   - Work (business logic) like:
//       - making API and Database calls
//       - Deserializing data
//       - Checking responses for errors
//       - Model Creation
//       - Orchestration between multiple services

// Benefits of a Services

//   - Separarion of Concerns / Single Responsibility
//   - More testable code
//   - D.R.Y code
//   - Code readability

// ListenableServiceMixin

//   - makes services listenable within the ViewModels that use them

//   - best combined with get derived methods in the class that needs to observe
//     the mutable field within the listenable service

//   - by default all mutable fields are listened to

// Flutter MixIn

//   - defined code that can be reused in multiple class hierarchies
//   - adds extra functionality to classes as you can only inherit (extend) from one class in dart at a time
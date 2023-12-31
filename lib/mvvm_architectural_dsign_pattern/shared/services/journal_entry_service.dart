import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/factory/factory.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
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
      // use Factory to create new model instances
      Factory.createJournalEntry(
        entryId: 1001,
        userId: 42,
        content: 'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Factory.createJournalEntry(
        entryId: 1002,
        userId: 42,
        content:
            'Every kingdom divided against itself is brought to desolation, every city or house divided against itself shall not stand.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Factory.createJournalEntry(
        entryId: 1003,
        userId: 42,
        content: 'You are a light on a hill that can not be hid.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Factory.createJournalEntry(
        entryId: 1005,
        userId: 42,
        content: 'Emptiness is calmness, calmness is emptiness.',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Factory.createJournalEntry(
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

// TODO: add comments

// Service Class

// ListenableServiceMixin

// Flutter MixIn
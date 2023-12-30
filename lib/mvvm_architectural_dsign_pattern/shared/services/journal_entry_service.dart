import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/factory/factory.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';

// ! typically instantiated with a service locator like the get_it package
final journalEntryService = JournalEntryService();

class JournalEntryService extends ChangeNotifier {
  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  /// Represents fake API call to backend to retrieve deserialized domain model data.
  Future<void> fakeApiCallToGetAllEntries() async {
    // mimic a really long delay, typical API calls are much faster than this.
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    // represents data received from an API call response body that would typically be deserialized into a collection of domain model objects.
    _journalEntries = <BaseJournalEntry>[
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

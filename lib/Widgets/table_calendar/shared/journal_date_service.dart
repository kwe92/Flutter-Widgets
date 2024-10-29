// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/factory/factory.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/models/base_journal_entry.dart';

final journalDateService = JournalDateService();

class JournalDateService extends ChangeNotifier {
  List<DateTime> _updatedDates = [
    DateTime.now().add(const Duration(days: -82)),
    DateTime.now().add(const Duration(days: -78)),
    DateTime.now().add(const Duration(days: -74)),
    DateTime.now().add(const Duration(days: -70)),
    DateTime.now().add(const Duration(days: -66)),
    DateTime.now().add(const Duration(days: -62)),
    DateTime.now().add(const Duration(days: -58)),
    DateTime.now().add(const Duration(days: -54)),
    DateTime.now().add(const Duration(days: -50)),
    DateTime.now().add(const Duration(days: -46)),
    DateTime.now().add(const Duration(days: -42)),
    DateTime.now().add(const Duration(days: -38)),
    DateTime.now().add(const Duration(days: -32)),
    DateTime.now().add(const Duration(days: -28)),
    DateTime.now().add(const Duration(days: -24)),
    DateTime.now().add(const Duration(days: -20)),
    DateTime.now().add(const Duration(days: -16)),
    DateTime.now().add(const Duration(days: -12)),
    DateTime.now().add(const Duration(days: -8)),
    DateTime.now().add(const Duration(days: -4)),
    DateTime.now()
  ];

  List<BaseJournalEntry> _journalEntries = [];

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  // List<DateTime> get updatedDates => _updatedDates;

  DateTime get maxDate => getMaxDate(_updatedDates);

  DateTime get minDate => getMinDates(_updatedDates);

  Future<void> fakeApiCallToGetAllEntries() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    // TODO: make the indices unique

    _journalEntries = <BaseJournalEntry>[
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index,
          userId: index,
          content: '$index: ' 'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 1,
          userId: index + _updatedDates.length,
          content: '${index + _updatedDates.length}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 2,
          userId: index + _updatedDates.length * 2,
          content: '${index + _updatedDates.length * 2}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 3,
          userId: index + _updatedDates.length * 3,
          content: '${index + _updatedDates.length * 3}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 4,
          userId: index + _updatedDates.length * 4,
          content: '${index + _updatedDates.length * 4}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 5,
          userId: index + _updatedDates.length * 5,
          content: '${index + _updatedDates.length * 5}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 6,
          userId: index + _updatedDates.length * 6,
          content: '${index + _updatedDates.length * 6}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 7,
          userId: index + _updatedDates.length * 7,
          content: '${index + _updatedDates.length * 7}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 8,
          userId: index + _updatedDates.length * 8,
          content: '${index + _updatedDates.length * 8}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 9,
          userId: index + _updatedDates.length * 9,
          content: '${index + _updatedDates.length * 9}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 10,
          userId: index + _updatedDates.length * 10,
          content: '${index + _updatedDates.length * 10}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 11,
          userId: index + _updatedDates.length * 11,
          content: '${index + _updatedDates.length * 11}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
      ...List.generate(
        _updatedDates.length,
        (index) => AbstractFactory.createJournalEntry(
          entryId: 1000 + index + 12,
          userId: index + _updatedDates.length * 12,
          content: '${index + _updatedDates.length * 12}: '
              'Begin, to begin is half the work let half still remain. Again beginthis and thou wilt have finished.',
          createdAt: _updatedDates[index],
          updatedAt: _updatedDates[index],
        ),
      ),
    ];

    notifyListeners();
  }
}

// TODO: Review
DateTime getMaxDate(List<DateTime> dates) => dates.reduce((a, b) => a.isAfter(b) ? a : b);

DateTime getMinDates(List<DateTime> dates) => dates.reduce((a, b) => b.isAfter(a) ? a : b);

import 'package:flutter/widgets.dart';
import 'package:flutter_widgets/Widgets/table_calendar/shared/journal_date_service.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';

class JournalDateViewModel extends ChangeNotifier {
  bool _isLoading = false;

  List<BaseJournalEntry> _journalEntries = [];

  bool get isLoading => _isLoading;

  List<BaseJournalEntry> get journalEntries => _journalEntries;

  JournalDateViewModel() {
    initialize();
  }

  void setIsLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> initialize() async {
    setIsLoading(true);

    await journalDateService.fakeApiCallToGetAllEntries();

    _journalEntries = journalDateService.journalEntries;

    setIsLoading(false);
  }
}

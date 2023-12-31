import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/get_it.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';

// module responsible for retrieving or creating an instance of a registered global dependency

JournalEntryService get journalEntryService {
  return locator.get<JournalEntryService>();
}

// using getter computed method to make service global variables immutable
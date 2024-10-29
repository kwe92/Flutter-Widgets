import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/services/get_it.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/services/journal_entry_service.dart';

// module responsible for retrieving or creating an instance of a registered global dependency

JournalEntryService get journalEntryService => locator.get<JournalEntryService>();
// using getter method computed variables to make service global variables immutable
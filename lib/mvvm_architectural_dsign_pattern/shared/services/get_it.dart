import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';
import 'package:get_it/get_it.dart';

// module responsible for registering global dependencies as Singleton's and Factoy's

final GetIt locator = GetIt.I;

/// register global dependencies used throughout your application
void configureDependencies() {
  locator.registerLazySingleton(() => JournalEntryService());
}

// TODO: add comments

// Why Use Services and a Service Locator?

//   - 
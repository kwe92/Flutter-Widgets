import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';
import 'package:get_it/get_it.dart';

// module responsible for registering global dependencies as Singleton's and Factoy's (not to be confused with the creational design pattern)

final GetIt locator = GetIt.I;

/// register global services (dependencies) used throughout your application.
void configureDependencies() => locator.registerLazySingleton(() => JournalEntryService());

// Why Use Services and a Service Locator?

//   - removes application and business logic (separation of concerns) from your View (Widgets/ U.I. / Presentation layer)
//     and ViewModel (mutable presentation logic) classes
//   - if you are implementing the M-V-VM Architectural Design Pattern
//   - removes direct dependencies (the amount of imports a modules has)
//     allowing code to be organized, maintainable, scalable and testable (mocking is easier)

//   get_it Service Locator

//     - a service locator package for Dart and Flutter projects inspired by .Net Splat
//     - GetIt is a Singleton which means you are using the same instance throughout your application
//     - register and create instances in constant time O(1)
//     - can use Dependency Inversion to return concrete implementations based on abstract contracts
//       using an abstract base class as a registration type e.g.:

//         ~ GetIt.instance.registerSingleton<RegistrationType>(ConcreteImplementationOfRegistrationType())
//         ~ GetIt.instance.registerSingleton<AbstractClass>(ConcreteImplementationOfAbstractClass())

//     - GetIt is best used by assigning a GetIt.instance (or GetIt.I for brevity)
//       to a global (euphemistic ambient) variable
//     - you can name the variable whatever you want (`locator` is the choosen name I use for my GetIt service locator variable)

// How to Use get_it Service Locator

//   1: assign GetIt.instance to global variable
//   2.a: implement a function to register services to GetIt.instance variable (`configureDependencies` is the choosen name I use for my register function)
//   2.b: insure your dependency/service registration function is called within your startup code as high as possible
//   3: access registered objects by calling locator.get<RegisteredConcreteImplementation>()
//     - I prefer to access registered objects by using global getter method computed variables as shown bellow:

// note: there should not be a leading unerscore, was placed there to not have duplicative global variable names
JournalEntryService get _journalEntryService {
  return locator.get<JournalEntryService>();
}

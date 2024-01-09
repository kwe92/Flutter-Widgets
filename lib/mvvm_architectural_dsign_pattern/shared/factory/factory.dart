import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/journal_entry.dart';

/// Responsible for the creation (instantiation) of all consumed
/// concrete class implementations for both high level and low level modules
class Factory {
  const Factory._();

  static BaseJournalEntry createJournalEntry({
    int? entryId,
    int? userId,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      JournalEntry(
        entryId: entryId,
        userId: userId,
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  static BaseJournalEntry createJournalEntryFromMap(Map<String, dynamic> map) => JournalEntry(
        entryId: map['entry_id'],
        userId: map['user_id'],
        content: map['content'],
        createdAt: map['created_at'],
        updatedAt: map['updated_at'],
      );
}

// Factory Method Pattern (Creational Design Pattern) | static Class That Creates Objects

//   - also referred to as the Virtual Constructor Pattern
//   - one of the most widely used creational design patterns
//   - used to create objects via a static Factory class
//   - the Factory class implements static methods containing creation logic
//     where objects are created at compile time
//   - Factory class methods create and return objects adhering to abstraction contracts
//     (i.e. the return type of a Factory static method is an interface or abstract class)
//   - Factory method implementations conceal creation logic away from clients
//   - adds flexibility to object creation architecture without adding too much complexity
//   - you can't define static method signatures within an abstraction (interface / abstract base class)
//     therefore a static Factory Class is required to handle instantiation (creation of objects)
//   - contains concrete dependancies adhering to abstract contracts (interface or abstract class)

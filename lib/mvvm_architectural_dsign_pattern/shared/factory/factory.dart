import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/base_journal_entry.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/models/journal_entry.dart';

// TODO: add UpdatedEntry

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

  static BaseJournalEntry createJournalEntryFromMap(Map<String, dynamic> map) {
    return JournalEntry(
      entryId: map['entry_id'],
      userId: map['user_id'],
      content: map['content'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}
// TODO: add notes for Factory Methods and Dependency Injection from Dart Foundation and Notes
// You can't define factory or static methods within an abstraction (interface / abstract base class)
// Therefore a Factory Class is required to handle instantiation (creation of objects) and inject dependencies 

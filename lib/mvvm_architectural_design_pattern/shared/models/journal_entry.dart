import 'dart:convert';

import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/models/base_journal_entry.dart';

/// Represents the Domain Model and DTO (Data Transfer Object) for journal entries.
class JournalEntry extends BaseJournalEntry {
  const JournalEntry({
    required super.entryId,
    required super.userId,
    required super.content,
    required super.createdAt,
    required super.updatedAt,
  });

  @override
  String toJSON() => jsonEncode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'entry_id': entryId ?? 0,
        'user_id': userId ?? '',
        'content': content ?? '',
        'created_at': createdAt ?? DateTime.now(),
        'updated_at': updatedAt ?? DateTime.now(),
      };

  @override
  String toString() {
    return 'JournalEntry(entryId: $entryId, userId: $userId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}


// Model Class (M-V-VM: Model-View-ViewModel Architectural Design Pattern) 

//   - Represents the Domain Model that encapsulates your applications data, part of Domain Driven Design
//   - The Model Class also serves as a DTO (Data Transfer Object) facilitating communication between API's and your application
//   - The communication mechanism consists mainly of marshaling (serialization) and unmarshaling (deserialization, can be handed off to a Factory Class)
//     of the domain model to and from JSON respectively
//   - Model Classes are typically immutable where possible
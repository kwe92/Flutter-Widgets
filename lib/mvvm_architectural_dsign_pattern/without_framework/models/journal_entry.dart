import 'dart:convert';

/// Represents the domain model of our application and also serves as a DTO (Data Transfer Object) between our frontend and any API's we interact with providing the required data.
class JournalEntry {
  final int entryId;
  final int userId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalEntry({
    required this.entryId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Deserializes properly structures JSON string into domain model object.
  factory JournalEntry.fromJSON(String json) => JournalEntry.fromMap(jsonDecode(json));

  /// Serializes current instance into a json string.
  String toJSON() => jsonEncode(toMap());

  factory JournalEntry.fromMap(Map<String, dynamic> map) => JournalEntry(
        entryId: map['entry_id'],
        userId: map['user_id'],
        content: map['content'],
        createdAt: map['created_at'],
        updatedAt: map['updated_at'],
      );

  Map<String, dynamic> toMap() => {
        'entry_id': entryId,
        'user_id': userId,
        'content': content,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  String toString() {
    return 'JournalEntry(entryId: $entryId, userId: $userId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

// Model Class
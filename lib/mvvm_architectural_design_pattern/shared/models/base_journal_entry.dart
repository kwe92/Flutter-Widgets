abstract class BaseJournalEntry {
  final int? entryId;
  final int? userId;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const BaseJournalEntry({
    this.entryId,
    this.userId,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  /// Serialize current instance into a json string.
  String toJSON();

  Map<String, dynamic> toMap();

  @override
  String toString();
}

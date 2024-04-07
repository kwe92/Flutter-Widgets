// TODO: add updated at column

class Note {
  int? id;
  final String title;
  final String content;
  final DateTime createdAt;

  Note({
    this.id,
    required this.content,
    required this.title,
    required this.createdAt,
  });

  factory Note.fromJSON(Map<String, dynamic> json) => Note(
        id: json['id'],
        content: json['content'],
        title: json['title'],
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'title': title,
        'created_at': createdAt.toString(),
      };

  @override
  String toString() {
    return 'Note(id: $id, title: $title, content: $content, createdAt: $createdAt)';
  }
}

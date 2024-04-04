class Note {
  final int id;
  final String title;
  final String content;

  const Note({
    required this.id,
    required this.content,
    required this.title,
  });

  factory Note.fromJSON(Map<String, dynamic> json) => Note(
        id: json['id'],
        content: json['content'],
        title: json['title'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'title': title,
      };
}

import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/models/photo.dart';

class Note {
  int? id;
  List<Photo?>? images;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.images,
    this.updatedAt,
  });

  factory Note.fromJSON(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        images: json['images'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'created_at': createdAt.toString(),
        'updated_at': updatedAt == null ? createdAt.toString() : updatedAt.toString(),
      };

  @override
  String toString() {
    return 'Note(id: $id, images: $images, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

class Photo {
  int? id;
  int noteID;
  final String imageName;

  Photo({this.id, required this.noteID, required this.imageName});

  Map<String, dynamic> toMap() => {
        'id': id,
        'note_id': noteID,
        'image_name': imageName,
      };

  factory Photo.fromJSON(Map<String, dynamic> json) => Photo(
        id: json['id'],
        noteID: json['note_id'],
        imageName: json['image_name'],
      );

  @override
  String toString() => 'Photo(id: $id, noteID: $noteID, imageName: $imageName)';
}

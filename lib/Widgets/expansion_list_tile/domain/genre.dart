class GenreModel {
  const GenreModel(
      {required this.genre, required this.image, required this.description});
  final String genre;
  final String image;
  final String description;

  factory GenreModel.fromJSON(Map<String, String> json) => GenreModel(
      genre: json['genre']!,
      image: json['image']!,
      description: json['description']!);

  static List<GenreModel> fromList(List jsonList) {
    return [
      for (var i = 0; i < jsonList.length; i++) GenreModel.fromJSON(jsonList[i])
    ];
  }

  @override
  String toString() =>
      'GenreModel(genre: $genre, image: $image, description: $description)';
}

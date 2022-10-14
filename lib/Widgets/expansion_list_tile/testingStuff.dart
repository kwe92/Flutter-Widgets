import 'package:flutter_widgets/Widgets/expansion_list_tile/data/genre_data.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';

final List<GenreModel> genreList = GenreModel.fromList(genreJSON);
// final genreList = [
//   for (var i = 0; i < genreJSON.length; i++) GenreModel.fromJSON(genreJSON[i])
// ];

void main(List<String> args) {
  print(genreList.firstWhere((genre) => genre.genre.toLowerCase() == 'seinen'));
}

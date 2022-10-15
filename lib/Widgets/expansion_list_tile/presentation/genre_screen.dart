import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/constants/layout.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/genreCard.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({required this.genreEntity, super.key});
  final GenreModel genreEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          genreEntity.genre,
          style: const TextStyle(
            fontSize: 52,
            fontFamily: Fonts.secondary,
          ),
        )),
        body: GenreCard(
            //genre: genreEntity.genre,
            image: genreEntity.image,
            description: genreEntity.description),
      ),
    );
  }
}

// ExpansionTile (Drop Down List - Layout Widget??)
//  - One of the easiest ways to expand a list
//  - A ListTile that onTap exposes its children with an animeated arrow

// ListTile
//  - Material Design list specifications
//  - Material list items
//  - Makes adding icons, callbacks, and text easy
//  - leading and trailing icons, a column of texts inbetween
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/constants/layout.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/data/genre_data.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/genre_screen.dart';

class WorkingWithExpansionListTile extends StatelessWidget {
  WorkingWithExpansionListTile({super.key});
  final genreList = GenreModel.fromList(genreJSON);
  GenreModel getGenre(genre) {
    return genreList.firstWhere((ele) => ele.genre.toLowerCase() == genre);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return SafeArea(
            child: Scaffold(
              // appBar: AppBar(
              //   title: const Text('ExpansionTile Widget'),
              // ),
              body: Column(
                children: [
                  ExpansionTile(
                    collapsedBackgroundColor:
                        const Color.fromRGBO(88, 82, 123, 1),
                    title: const Text(
                      'Anime Genre',
                      style: TextStyle(fontSize: Sizes.p20),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Isekai'),
                        onTap: () {
                          Navigator.pushNamed(context, '/isekai');
                        },
                      ),
                      ListTile(
                        title: const Text('Slice of Life'),
                        onTap: () {
                          Navigator.pushNamed(context, '/sol');
                        },
                      ),
                      ListTile(
                        title: const Text('Seinen'),
                        onTap: () {
                          Navigator.pushNamed(context, '/seinen');
                        },
                      ),
                      ListTile(
                        title: const Text('Harem'),
                        onTap: () {
                          Navigator.pushNamed(context, '/harem');
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      fit: BoxFit.fitHeight,
                      'assets/seinen.webp',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        '/isekai': (BuildContext context) {
          return GenreScreen(genreEntity: getGenre('isekai'));
        },
        '/sol': (BuildContext context) {
          return GenreScreen(genreEntity: getGenre('slice of life'));
        },
        '/seinen': (BuildContext context) {
          return GenreScreen(genreEntity: getGenre('seinen'));
        },
        '/harem': (BuildContext context) {
          return GenreScreen(genreEntity: getGenre('harem'));
        },
      },
    );
  }
}

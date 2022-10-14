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
import 'package:flutter_widgets/Widgets/expansion_list_tile/data/genre_data.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';

class WorkingWithExpansionListTile extends StatelessWidget {
  const WorkingWithExpansionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final genreList = GenreModel.fromList(genreJSON);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile Widget'),
        ),
        body: ExpansionTile(
          title: const Text('Anime Genre'),
          children: <Widget>[
            ListTile(
              title: const Text('Isekai'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Slice of Life'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Seinen'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Harem'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

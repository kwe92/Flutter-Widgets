import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/Riverpod/working_with_riverpod.dart';
import 'package:flutter_widgets/Widgets/choice_chip.dart';
import 'package:flutter_widgets/Widgets/dot_adaptive.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_nav.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_widget_no_scaffold.dart';
import 'package:flutter_widgets/Widgets/builder_widget.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/data/genre_data.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/expansion_tile.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/genreCard.dart';
import 'package:flutter_widgets/Widgets/fitted_box_widget.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/screen_one.dart';
import 'package:flutter_widgets/Widgets/separation_encapsulation/conuter_app/counter_app.dart';
import 'package:flutter_widgets/Widgets/separation_encapsulation/conuter_app/review/counter_app2.dart';
import 'package:flutter_widgets/Widgets/show_search_widget.dart';
import 'package:flutter_widgets/Widgets/sliver_app_bar.dart';
import 'package:flutter_widgets/Widgets/stepper_widget.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/stream_builder.dart';
import 'package:flutter_widgets/Widgets/wrap_widget.dart';

// WorkWithBuilderWidget() MA
// WorkingWIthStepperWidget() MA
// WorkingWithFittedBoxWidget() MA
// WorkingWithShowSearchWidget() MA
// MaterialAppNoScaffold() MA
// CustomMaterialAppNav() MA
// WorkingWithDotAdaptive()
// WorkingWithHero()
// WorkingWithStreamBuilder()
// WorkingWithRiverpod()
// Counter()
// CounterApp()
// WorkingWithSliverAppBar()
// WorkingWithWrap()
// WorkingWithExpansionListTile()
// nl

final List<GenreModel> genreList = GenreModel.fromList(genreJSON);
final genreEntity =
    genreList.firstWhere((genre) => genre.genre.toLowerCase() == 'isekai');
int main() {
  runApp(
    MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Designing Genre Card'),
            ),
            body: GenreCard(
                genre: genreEntity.genre,
                image: genreEntity.image,
                description: genreEntity.description)),
      ),
    ),
  );
  return 0;
}

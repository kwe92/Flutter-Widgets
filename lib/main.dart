import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/Riverpod/working_with_riverpod.dart';
import 'package:flutter_widgets/Widgets/choice_chip.dart';
import 'package:flutter_widgets/Widgets/dot_adaptive.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_nav.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_widget_no_scaffold.dart';
import 'package:flutter_widgets/Widgets/builder_widget.dart';
import 'package:flutter_widgets/Widgets/fitted_box_widget.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/screen_one.dart';
import 'package:flutter_widgets/Widgets/separation_encapsulation/conuter_app/counter_app.dart';
import 'package:flutter_widgets/Widgets/separation_encapsulation/conuter_app/review/counter_app2.dart';
import 'package:flutter_widgets/Widgets/show_search_widget.dart';
import 'package:flutter_widgets/Widgets/stepper_widget.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/stream_builder.dart';

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

int main() {
  runApp(
    MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: const CounterApp(),
    ),
  );
  return 0;
}

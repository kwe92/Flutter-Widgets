import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/quotes_feature/ui/scaffold_with_navigation.dart';
import 'package:flutter_widgets/mvvm_architectural_design_pattern/shared/services/get_it.dart';
// import 'package:flutter_widgets/Widgets/quotes_feature/ui/quotes_view.dart';
// import 'package:flutter_widgets/Widgets/table_calendar/complex_example/calendar_complex_example.dart';
// import 'package:flutter_widgets/Widgets/table_calendar/events_example/calendar_event_example_view.dart';
// import 'package:flutter_widgets/Widgets/table_calendar/journal_date_view.dart';
// import 'package:flutter_widgets/share_content_example/share_content_example.dart';

void main() {
  configureDependencies();
  runApp(const MaterialApp(
    home: ScaffoldWithNavigation(),
    // home: ShareExample(),
  ));
}

// void main() {
//   runApp(const MaterialApp(
//     home: JournalDateView(),
//   ));
// }

// void main() {
//   runApp(const MaterialApp(
//     home: TableEventsExampleView(),
//   ));
// }

// void main() {
//   runApp(MaterialApp(
//     home: TableComplexExample(),
//   ));
// }

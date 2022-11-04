import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/StateManagement/parent_state_management_example.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/Riverpod/working_with_riverpod.dart';
import 'package:flutter_widgets/Widgets/choice_chip.dart';
import 'package:flutter_widgets/Widgets/container/container_widget.dart';
import 'package:flutter_widgets/Widgets/dot_adaptive.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_nav.dart';
import 'package:flutter_widgets/Widgets/MaterialApp/material_app_widget_no_scaffold.dart';
import 'package:flutter_widgets/Widgets/builder_widget.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/data/genre_data.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/domain/genre.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/genre_home_screen.dart';
import 'package:flutter_widgets/Widgets/expansion_list_tile/presentation/genreCard.dart';
import 'package:flutter_widgets/Widgets/fitted_box_widget.dart';
import 'package:flutter_widgets/Widgets/Hero_Widget/screen_one.dart';
import 'package:flutter_widgets/Widgets/flutter_layout_example/lake_review_app.dart/location_review_app.dart';
import 'package:flutter_widgets/Widgets/neumorphism/first_neumorphic_app/test_neumorphic_button.dart';
import 'package:flutter_widgets/Widgets/neumorphism/first_neumorphic_app/first_neumorphic_app.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/neumorphic_practice.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/neumorphic_practice2.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/neumorphic_practice3.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/neumorphic_practice4.dart';
import 'package:flutter_widgets/Widgets/popup_menu_button.dart';
import 'package:flutter_widgets/Widgets/providers/provider_consumer_review.dart';
import 'package:flutter_widgets/Widgets/range_slider.dart';
import 'package:flutter_widgets/Widgets/neumorphism/separation_encapsulation/old_counter/counter_app_original.dart';
import 'package:flutter_widgets/Widgets/neumorphism/separation_encapsulation/conuter_app/review/counter_app/counter_app2.dart';
import 'package:flutter_widgets/Widgets/show_date_picker.dart';
import 'package:flutter_widgets/Widgets/show_search_widget.dart';
import 'package:flutter_widgets/Widgets/show_time_picker.dart';
import 'package:flutter_widgets/Widgets/sliver_app_bar.dart';
import 'package:flutter_widgets/Widgets/stepper_widget.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/stream_builder.dart';
import 'package:flutter_widgets/Widgets/wrap_widget.dart';
import 'ResponsiveDesignExamples/MediaQuery/responsive_app.dart';
import 'Widgets/StateManagement/internal_state_management_example.dart';
import 'Widgets/StateManagement/mix_and_match_state_management.dart';
import 'Widgets/animated_cross_fade.dart';
import 'Widgets/bottom_navigaton.dart';
import 'Widgets/bottom_sheet_modal.dart';
import 'Widgets/flutter_layout_example/layout_example2.dart';
import 'Widgets/flutter_layout_example/products.dart';
import 'Widgets/page_view.dart';
import 'Widgets/visiblity_widget.dart';

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
// CounterApp() Provider Scope / Neumorphic
// WorkingWithSliverAppBar()
// WorkingWithWrap()
// WorkingWithExpansionListTile() MA
// WorkingWithContainer()
// WorkingWithTimePicker()
// WorkingWithDatePicker()
// WorkingWithPopUpMenuButton()
// const LocationApp() MA
// WorknigWithRangeSlider()
// WorkingWithCunsumerExample1(title: 'Working With Cunsumer') ProviderScope
// TestNeumorphic() Neumorphic
// FirstNeumorphicApp() Neumorphic
// NeumorphicPractice1 () Custom Neumorphic
// NeumorphicPractice2() Custom Neumorphic
// NeumorphicPractice3() Custom Neumorphic
// WorkingWithVisibility()
// WorkingWithBottomNavBar() MA??
// PageViewApp() MA
// BottomModalApp()
// AnimatedCrossFadeApp()
// const ShoppingListApp(products: productList,) MA with a named arguement
// const InternalStateManagementExample() MA
// const ParentWidget() MA | Example of parent Stateful Widget Managing a Stateless Widgets state
// const ParentWidget2() MA | Example of a Mix and Match approach to state management, where part of a childs state is handled internally and the rest by the parent
// WorkingWithMediaQuery()
//
//
//
//
//
//
//
//
//
//
// nl
void main() {
  runApp(
    const ResponsiveApp(),
  );

  // runApp(
  //   const MaterialApp(
  //     home: WorkingWithMediaQuery(),
  //   ),
  // );

  // runApp(
  //   const ProviderScope(
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: NeumorphicPractice4(),
  //     ),
  //   ),
  // );

  // runApp(
  //   const ProviderScope(
  //     child: MaterialApp(home: CounterApp()),
  //   ),
  // );

  // runApp(
  //   const ProviderScope(
  //     child: NeumorphicApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'Flutter Demo',
  //       themeMode: ThemeMode.dark,
  //       theme: NeumorphicThemeData(
  //         baseColor: Color(0xFFFFFFFF),
  //         lightSource: LightSource.topLeft,
  //         depth: 10,
  //       ),
  //       darkTheme: NeumorphicThemeData(
  //         baseColor: Color(0xFF3E3E3E),
  //         lightSource: LightSource.topLeft,
  //         depth: 6,
  //       ),
  //       home: TestNeumorphic(),
  //     ),
  //   ),
  // );
}

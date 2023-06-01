import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/material_state/material_state_example.dart';
// import 'package:flutter_widgets/Widgets/countdown_timer.dart';
import 'package:flutter_widgets/Widgets/reusable_modal/modal_widget.dart';

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
// NeumorphicPractice3() Custom Neumorphic | Custom Neumorphic Button
// NeumorphicPractice4() Custom Neumorphic | Custom Neumorphic Screen
// NeumorphicPractice5() Custom Neumorphic | Custom Neumorphic AppBar and Screen
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
// ResponsiveApp()
// WorkingWithMediaQuery()
// WorkingWithFutureBuilder() MA
// WorkingWithConstraints
// WorkingWithDatePickerInput
// CustomDropDownMenu()
// SignInExample()
// ValueNotifierCounter()
// CountDownTimerApp
// ModalWidget()
//
//
//
//
//
// nl
Future<void> main() async {
  runApp(const MaterialApp(
    // theme: ThemeData(useMaterial3: true),
    home: WorkingWithMaterialState(),
  ));
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // runApp(SignInExample());

  // runApp(MaterialApp(
  //   home: Scaffold(
  //     backgroundColor: Colors.grey,
  //     appBar: AppBar(
  //       title: const Text('Rep Counter'),
  //     ),
  //     body: const Center(
  //       child: RepCounter(value: 1, totalValue: 5, fontSize: 100),
  //     ),
  //   ),
  // ));

  // runApp(
  //   const MaterialApp(
  //     home: TimerWidget(),
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

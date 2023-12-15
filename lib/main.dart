// ignore_for_file: prefer_function_declarations_over_variables, unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/example_from_flutter_portal_docs.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/menu_example.dart';
import 'package:flutter_widgets/Widgets/Portals/simple_portal_example/text_field_with_modal_view.dart';
import 'package:flutter_widgets/Widgets/animations/animated_cross_fade.dart';
import 'package:flutter_widgets/Widgets/auto_route_guide/routes/app_router.dart';
import 'package:flutter_widgets/Widgets/camera_preview_widget.dart';
import 'package:flutter_widgets/Widgets/camera_preview_widget_model.dart';
import 'package:flutter_widgets/Widgets/grid_view_list_generator.dart';
import 'package:flutter_widgets/Widgets/native_device_orientation_example.dart';
import 'package:flutter_widgets/Widgets/orientation_builder.dart';
import 'package:flutter_widgets/Widgets/plaid_example/ui/plaid_example_view.dart';
import 'package:flutter_widgets/Widgets/push_notifications/services/notification_service.dart';
import 'package:flutter_widgets/Widgets/push_notifications/ui/push_notification_view.dart';
import 'package:flutter_widgets/Widgets/range_slider.dart';
import 'package:flutter_widgets/Widgets/reusable_modal/modal_widget.dart';
import 'package:flutter_widgets/Widgets/sets_reps_hold_time_widget.dart';
import 'package:flutter_widgets/Widgets/sliders/slider_view.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_color_gradient_model.dart';
import 'package:flutter_widgets/Widgets/switch/switch_widget_view.dart';
import 'package:flutter_widgets/Widgets/switch/switch_widget_view_model.dart';
import 'package:flutter_widgets/Widgets/working_with_dialog/ui/model/check_box_model.dart';
import 'package:flutter_widgets/Widgets/working_with_dialog/ui/working_with_dialog.dart';
import 'package:flutter_widgets/examples/colorSelectedListItem_onTap/color_Selected_ListItem_onTap.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/ui/journal_view.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/ui/journal_view_model.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_widgets/Widgets/colored_box_widget.dart';
// import 'package:flutter_widgets/Widgets/countdown_timer.dart';
// import 'package:flutter_widgets/Widgets/reusable_modal/modal_widget.dart';

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
// WorkingWithMaterialState()
// WorkingWithColoredBox()
// WorkingWithGridView()
// WorkingWithOrientationBuilder
// WorkingWithNativeDeviceOrientation
// WorkingWithCameraPreview
//
//
//
// nl

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instatiate ViewModel as a ChangeNotifier to be consumed by its respective View
    return const MaterialApp(
      home: JournalEntryView(),
    );
  }
}

//! PORTAL EXAMPLE 

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Portal(
//       child: MaterialApp(
//         home: TextFieldWithModalView(),
//       ),
//     );
//   }
// }
//! PORTAL EXAMPLE 

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => SelectListItemOnTapViewModel(),
//       child: SelectListItemOnTap(),
//     ),
//   );
// }

// final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// void main() {
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) => MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) => SwitchWidgetViewModel(),
//           )
//         ],
//         child: const MaterialApp(
//           home: SwitchWidgetView(),
//         ),
//       );
// }

// ??---------------Working With Sliders---------------??

// class MyApp extends StatelessWidget {
//   static const String title = "Sliders";

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => SliderColorGradientModel(),
//         )
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(
//           colorScheme: const ColorScheme.light(
//             primary: Colors.lightBlue,
//           ),
//         ),
//         home: const SliderView(),
//       ),
//     );
//   }
// }

// ??---------------Working With Plaid-------------------------------------------------------------

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const PlaidExampleView();
//   }
// }

//!----------------------Working With Notifications--------------------------------------

// Prefixes runApp

// WidgetsFlutterBinding.ensureInitialized();

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();

//     NofiService.initialize(flutterLocalNotificationsPlugin);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: WorkingWithPushNotifications(),
//     );
//   }
// }

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => CheckBoxModel(),
//     child: MaterialApp(
//       theme: ThemeData.light(
//         useMaterial3: true,
//       ),
//       home: const WorkingWithDialog(),
//     ),
//   ));
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: const SetsRepsWidget(),
//       theme: ThemeData.light(),
//     ),
//   );
// }

//------------------------------------------------------------

// ! ------continue REVIEW BELOW !!!!!

// ? working with auto_route
// void main() {
//   runApp(
//     const _AutoRouteApp(),
//   );
// }

// class _AutoRouteApp extends StatelessWidget {
//   const _AutoRouteApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AppRouter appRouter = AppRouter();
//     return MaterialApp.router(
//       routerConfig: appRouter.config(),
//     );
//   }
// }

// typedef NotifierCallback = ChangeNotifier Function(BuildContext context);

// final List<ChangeNotifierProvider> providers = [
//   ChangeNotifierProvider(
//     create: cameraPreviewNotifierCallback,
//   ),
// ];

// final NotifierCallback cameraPreviewNotifierCallback = (BuildContext context) => WorkingWithCameraPreviewModel();

// ! end continue

// void main() {
// TODO: need to look into why the providers are not working | maybe create a new main function for this section
// runApp(
//   MultiProvider(
//     providers: <ChangeNotifierProvider>[
//       ChangeNotifierProvider(
//         create: (BuildContext context) => WorkingWithCameraPreviewModel(),
//       ),
//     ],
//     child: const MaterialApp(home: WorkingWithCameraPreview()),
//   ),
// );

// runApp(const WorkingWithNativeDeviceOrientation());

// WidgetsFlutterBinding.ensureInitialized();
// SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: const ColorScheme.dark(
//           brightness: Brightness.dark,
//         ),
//       ),
//       home: const WorkingWithOrientationBuilder(),
//     ),
//   );
// }

// ? main with future

// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(useMaterial3: false), home: const ModalWidget(),
// //       home: WorkingWithMaterialState2(),
//     ),
//   );
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
// }

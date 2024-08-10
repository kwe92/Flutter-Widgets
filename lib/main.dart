import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedCrossFade/animated_cross_fade.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/animated_download_button.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/animated_page_route_transition_view.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/drag_ui_element_example.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/expandable_fab_example.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/staggered_menu_animation_view.dart';
import 'package:flutter_widgets/Widgets/auto_route_guide/routes/app_router.dart';
import 'package:flutter_widgets/Widgets/animations/create_shimmer_loading_example/example_shimmer_loading.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/custom_shimmer.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/shimmer_example_2/shimmer_example_2.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/shimmer_example_2/shimmer_example_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/drag_physics_simulation/drag_physics_example.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/widget_keys.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/theme/theme.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/destination_selection_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/location_detail_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/navigation/navigation_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/services/destination_service.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/splashScreen/ui/splash_view.dart';
import 'package:flutter_widgets/working_with_slivers/dynamic_layout_tutorial/custom_layout.dart';
import 'package:flutter_widgets/working_with_slivers/dynamic_layout_tutorial/custom_layout_02.dart';
import 'package:flutter_widgets/working_with_slivers/pinning_widgets_00.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    const MaterialApp(
      home: ExpandableFabExample(),
      // home: AnimatedDownloadButtonExample(),
      // home: StaggeredMenuAnimationExampleView(),
      // home: DragUiElementExampleView(),
      // home: AnimatedPageRouteTransitionView(),

      // home: DragPhysicsExample(),
      // home: ExampleShimmerLoading(),
      // home: ChangeNotifierProvider(
      //   create: (context) => ShimmerExampleViewModel(),
      //   child: const ExampleShimmerAnimationv2(),
      // ),
      // home: ExampleShimmerAnimation(),
      // home: DestinationSelectionView(),
    ),
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await databaseService.initialize();

  // runApp(MaterialApp.router(
  //   routerConfig: appRouter.config(),
  // ));

  // runApp(
  //   const MaterialApp(
  //     home: CustomSliverLayout02(),
  //   ),
  // );
  // runApp(
  //   MaterialApp(
  // navigatorKey: WidgetKey.navigatorKey,
  // scaffoldMessengerKey: WidgetKey.rootScaffoldMessengerKey,

  // home: const NotesView(),
  // theme: AppThemeNotes.getTheme(),
  // home: const ComplexLayoutExample(),

  // home: AwesomeNotificationExampleView(),
  //       ),
  // );
}

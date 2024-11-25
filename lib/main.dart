import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedCrossFade/animated_cross_fade.dart';
import 'package:flutter_widgets/Widgets/animations/animatedDownloadButton/animated_download_button.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/animated_page_route_transition_view.dart';
import 'package:flutter_widgets/Widgets/animations/animatingContainerProperties/container_animation_example.dart';
import 'package:flutter_widgets/Widgets/animations/animationDeepDive/animation_deep_dive.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/drag_ui_element_example.dart';
import 'package:flutter_widgets/Widgets/animations/expandableFab/expandable_fab_example.dart';
import 'package:flutter_widgets/Widgets/animations/explicitAnimations/using_explicit_animations.dart';
import 'package:flutter_widgets/Widgets/animations/explicitAnimations/using_explicit_animations_2.dart';
import 'package:flutter_widgets/Widgets/animations/explicitAnimations/using_explicit_animations_3.dart';
import 'package:flutter_widgets/Widgets/animations/implicitAnimations/dynamically_changing_tween_values.dart';
import 'package:flutter_widgets/Widgets/animations/implicitAnimations/using_tween_builder.dart';
import 'package:flutter_widgets/Widgets/animations/implicitAnimations/using_tween_builder_2.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/parallax_scrolling_effect_example_view.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/staggered_menu_animation_view.dart';
import 'package:flutter_widgets/Widgets/auto_route_guide/routes/app_router.dart';
import 'package:flutter_widgets/Widgets/animations/create_shimmer_loading_example/example_shimmer_loading.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/custom_shimmer.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/shimmer_example_2/shimmer_example_2.dart';
import 'package:flutter_widgets/Widgets/animations/custom_shimmer/shimmer_example_2/shimmer_example_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/drag_physics_simulation/drag_physics_example.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/gradient_chat_bubbles_example.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/ui/notes_view.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/database_service.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/widget_keys.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/app/theme/theme.dart';
import 'package:flutter_widgets/parseJsonInTheBackground/parsing_json_in_background_example.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/destination_selection_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/locationDetails/ui/location_detail_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/navigation/navigation_view.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/services/destination_service.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/splashScreen/ui/splash_view.dart';
import 'package:flutter_widgets/working_with_slivers/dynamic_layout_tutorial/custom_layout.dart';
import 'package:flutter_widgets/working_with_slivers/dynamic_layout_tutorial/custom_layout_02.dart';
import 'package:flutter_widgets/working_with_slivers/pinning_widgets_00.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  runApp(
    const MaterialApp(
      home: AnimationDeepDive(),
      // home: UsingExplicitAnimations3(),
      // home: UsingExplicitAnimations2(),
      // home: UsingExplicitAnimations(),
      // home: DynamicallyChangingTweenValues(),
      // home: UsingTweenBuilder2(),
      // home: UsingTweenBuilder(),
      // home: ParsingJsonInBackgroundExample(),
      // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      // theme: ThemeData.dark(useMaterial3: true).copyWith(primaryColor: const Color(0xFF4F4F4F)),
      // home: const GradientChatBubblesExample(),
      // home: const AnimatedContainerExample(),
      // home: const ParallaxScrollingEffectExampleView(),
      // home: ExpandableFabExample(),
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
      // home: CustomSliverLayout02(),
    ),
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await databaseService.initialize();

  // runApp(MaterialApp.router(
  //   routerConfig: appRouter.config(),
  // ));

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

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/animated_page_route_transition_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/page02.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/shared/app_bar_with_shadow.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/shared/custom_page_route_builder.dart';
import 'package:flutter_widgets/Widgets/animations/animatedPageRouteTransition/shared/image_with_title.dart';
import 'package:provider/provider.dart';

class AnimatedPageRouteTransitionView extends StatelessWidget {
  const AnimatedPageRouteTransitionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => AnimatedPageRouteTransitionViewModel(),
        builder: (context, _) {
          final model = context.watch<AnimatedPageRouteTransitionViewModel>();

          return Scaffold(
            appBar: AppBarWithDropShadow(
              title: const Text("Animated Cross Fade"),
              actions: [
                TextButton(
                  onPressed: () async {
                    model.setVisibility(false);

                    await Navigator.push(
                      context,
                      CustomPageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => const Page02(),
                      ),
                    );

                    model.setVisibility(true);
                  },
                  child: const Text('Switch'),
                ),
              ],
            ),
            body: AnimatedOpacity(
              opacity: model.isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const ImageWithTitle(
                title: "Isekai",
                assetImagePath: "assets/isekai.jpeg",
              ),
            ),
          );
        },
      ),
    );
  }
}

// TODO: write about the AnimatedOpacity widget

// AnimatedOpacity Class


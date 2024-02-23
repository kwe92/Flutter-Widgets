// Animated Cross Fade
//  - A widget that cross-fades between two given children
//    and animates itself between their sizes
//
//
// nl

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/expample02/animated_cross_fade_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/expample02/page02.dart';
import 'package:flutter_widgets/Widgets/animations/shared/custom_page_route_builder.dart';
import 'package:flutter_widgets/Widgets/animations/shared/image_with_title.dart';
import 'package:provider/provider.dart';

class AnimatedCrossFadeAppView extends StatelessWidget {
  const AnimatedCrossFadeAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => AnimatedCrossFadeAppViewModel(),
        builder: (context, _) {
          final model = context.watch<AnimatedCrossFadeAppViewModel>();
          return Scaffold(
            appBar: AppBar(
              title: const Text("Animated Cross Fade"),
              actions: [
                TextButton(
                  onPressed: () async {
                    model.setVisibility(false);

                    await Navigator.push(
                      context,
                      CustomPageRouteBuilder(
                        const Page02(),
                      ),
                    );

                    model.setVisibility(true);
                  },
                  child: const Text(
                    'Switch',
                  ),
                ),
              ],
            ),
            body: AnimatedOpacity(
              opacity: model.isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
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

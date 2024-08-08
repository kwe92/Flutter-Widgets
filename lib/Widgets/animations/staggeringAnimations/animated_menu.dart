import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/animated_menu_controller.dart';
import 'package:provider/provider.dart';

class AnimatedMenu extends StatelessWidget {
  const AnimatedMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          // Logo
          Positioned(
            left: 70,
            bottom: 0,
            child: Opacity(
              opacity: 0.2,
              child: SizedBox(
                width: 425,
                height: 425,
                child: SvgPicture.asset(
                  "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/flutter-logo.svg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // content
          ChangeNotifierProvider(
            create: (context) => AnimatedMenuController(),
            builder: (context, _) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _MenuItems(),
                    ),
                    _Button(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimatedMenuController>();

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.menuTitles.length,
      itemBuilder: (BuildContext context, int i) => AnimatedBuilder(
        animation: controller.staggeredController,
        builder: (BuildContext context, Widget? child) {
          // TODO: Review

          final double animationPercent = Curves.easeOut.transform(
            controller.itemSlideIntervals[i].transform(controller.staggeredController.value),
          );

          final double opacity = animationPercent;

          // the distance the widget slides in relation to the animation percentage
          final double slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(slideDistance, 0),
              child: child,
            ),
          );
        },
        child: Text(
          controller.menuTitles[i],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int i) => const SizedBox(height: 32),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AnimatedMenuController>();
    return SizedBox(
      width: double.infinity,
      child: AnimatedBuilder(
        animation: controller.staggeredController,
        builder: (BuildContext context, Widget? child) {
          // TODO: Review

          final double animationPercent = Curves.elasticOut.transform(
            controller.buttonInterval.transform(controller.staggeredController.value),
          );

          final double opacity = animationPercent.clamp(0.0, 1.0);

          final double scale = (animationPercent * 0.5) + 0.5;

          return Opacity(
            opacity: opacity,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          );
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/animated_menu.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/staggered_menu_animation_view_model.dart';
import 'package:provider/provider.dart';

class StaggeredMenuAnimationExampleView extends StatelessWidget {
  const StaggeredMenuAnimationExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
          create: (BuildContext context) => StaggeredMenuAnimationExampleViewModel(),
          builder: (BuildContext context, Widget? _) {
            final viewModel = context.watch<StaggeredMenuAnimationExampleViewModel>();

            return Scaffold(
              appBar: AppBar(
                elevation: 3,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                shadowColor: Colors.black.withOpacity(0.20),
                title: const Text("Staggered Menu Animation"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                      onPressed: viewModel.setToggleDrawer,
                      icon: Icon(
                        !viewModel.isToggled ? Icons.menu : Icons.close,
                      ),
                    ),
                  )
                ],
              ),
              body: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "Working WIth Animations!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: viewModel.drawerController,
                    builder: (context, _) {
                      return FractionalTranslation(
                        translation: Offset((1 - viewModel.drawerController.value), 0),
                        child: viewModel.isDrawerClosed() ? const SizedBox() : const AnimatedMenu(),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// TODO: Write comments and Summarize

// why is Transform.translate smoother than FractionalTranslation when staggering animations? When do you use one over the other?

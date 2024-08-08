import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/staggeringAnimations/animated_menu.dart';

class StaggeredMenuAnimationExample extends StatefulWidget {
  const StaggeredMenuAnimationExample({super.key});

  @override
  State<StaggeredMenuAnimationExample> createState() => _StaggeredMenuAnimationExampleState();
}

class _StaggeredMenuAnimationExampleState extends State<StaggeredMenuAnimationExample> with TickerProviderStateMixin {
  late AnimationController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(vsync: this, duration: const Duration(seconds: 0, milliseconds: 100));
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  bool isToggled = false;

  void _notifyWidget() {
    setState(() {});
  }

  void _toggleDrawer() {
    isToggled ? _drawerController.reverse() : _drawerController.forward();
    isToggled = !isToggled;
    _notifyWidget();
  }

  bool _isDrawerOpening() => _drawerController.value == 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
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
              animation: _drawerController,
              builder: (context, _) {
                return FractionalTranslation(
                  translation: Offset((1 - _drawerController.value), 0),
                  child: _isDrawerOpening() ? const SizedBox() : const Menu(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.20),
        title: const Text("Staggered Menu Animation"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(onPressed: _toggleDrawer, icon: Icon(!isToggled ? Icons.menu : Icons.close)),
          )
        ],
      );
}


// TODO: Write comments and Summarize

// why is Transform.translate smoother than FractionalTranslation when staggering animations? When do you use one over the other?

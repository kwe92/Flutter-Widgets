import 'package:flutter/material.dart';

class UsingExplicitAnimations extends StatefulWidget {
  const UsingExplicitAnimations({super.key});

  @override
  State<UsingExplicitAnimations> createState() => _UsingExplicitAnimationsState();
}

class _UsingExplicitAnimationsState extends State<UsingExplicitAnimations> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Color _color = Colors.lightBlue;

  @override
  void initState() {
    super.initState();
    // instatiated within init state as the AnimationController has its own state to manage and w e need access to 'this'
    _controller = AnimationController(
      vsync: this, // the referenced object to be notified about changes
      duration: const Duration(
          seconds:
              15), // how long the animation lasts | in our example how long will one complete rotation take which affects the speed of the rotation
    )..repeat(); // start the animation and repeat indefinitly without any visual distortion between the itterations
  }

  void _notifyWidget() => setState(() {});

  void _handleController() {
    if (_controller.isAnimating) {
      _controller.stop();
      return;
    }
    _controller.repeat();

    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RotationTransition(
          turns: _controller,
          alignment: Alignment.center,
          child:

              //  Image.asset('assets/galaxy.avif'),

              TweenAnimationBuilder(
            duration: const Duration(seconds: 15),
            tween: ColorTween(
              begin: Colors.white,
              end: _color,
            ),
            onEnd: () {
              _color = _color == Colors.lightBlue ? Colors.white : Colors.lightBlue;
              _notifyWidget();
            },
            builder: (context, value, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  value!,
                  // Color.lerp(Colors.white, Colors.red, value)!,
                  BlendMode.modulate,
                ),
                child: child,
              );
            },
            child: Image.asset('assets/galaxy.avif'),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: _handleController,
        icon: const Icon(
          Icons.back_hand,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // life-cycle managment of AnimationController: disposing of the controller
    _controller.dispose();
    super.dispose();
  }
}

// Code Based Animations: Explicit Animations

//   - complex animations that require an AnimationController

//   - animations only start when explictly asked too i.e. controller.forward()

//   - Typically requires a StatefulWidget

//   - requires life-cycle management of the AnimatedController (disposal)

//   - must be notified when a value changes (ChangeNotifier or StatefulWidget)

// When to Use Explicit Animations?

//   - your animation repeats multiple times or forever or their is some complex loop

//   - you want the ability to stop and start the animation given some user interaction or event

//   - the animation is continuous e.g. maybe reversed often

//   - there are multiple widgets that need to be coordinated and animated together
//     in some complex fashion, either simultaneously or staggered

// Transition Widgets

//   - built-in explicit animation widgets whose name ends with the word Transition

//   - e.g. SizeTransition, FadeTransition, etc

//   - a subclass of AnimatedWidget

// AnimationController Class

//   - a controller for an animation

//   - by default an AnimationController emits values from 0 to 1

//   - how many values and their granularity depends on the duration of the animation

//   - typically animations are started within init state and can be
//     stoped when disposed of

//   - can control multiple animations with a single controller

// TweenAnimationBuilder onEnd Parameter

//   - called once the animation is complete

//   - can be used to reverse an tween animation when combined 
//     with a stateful widget abd setState

// Ways to Create Explicit Animations

//   - FooTransition widgets (built-in)

//   - AnimatedWidget (custom)

//   - AnimatedBuilder (custom)
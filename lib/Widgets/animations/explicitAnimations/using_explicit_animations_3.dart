import 'package:flutter/material.dart';

class UsingExplicitAnimations3 extends StatefulWidget {
  const UsingExplicitAnimations3({super.key});

  @override
  State<UsingExplicitAnimations3> createState() => _UsingExplicitAnimations3State();
}

class _UsingExplicitAnimations3State extends State<UsingExplicitAnimations3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // create controller in build method so it onle gets created once and bot each time the widget is rebuilt
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Image.asset(
            'assets/ufo.jpeg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          top: 320,
          child: Transform.rotate(
            angle: 0.20,
            child: BeamTransition(
              animation: _controller,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class BeamTransition extends AnimatedWidget {
  // pass in animation controller  as Animation<double> to the listenable
  const BeamTransition({required Animation<double> animation, super.key}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    // the body of the build method is the body of the builder callback you would have used
    var animation = listenable as Animation<double>;
    return ClipPath(
      clipper: const BeamClipper(),
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: RadialGradient(radius: 1.5, colors: const [
            Colors.yellow,
            Colors.transparent,
          ], stops: [
            0,
            animation.value
          ]),
        ),
      ),
    );
  }
}


// Custom Explicit Animations: subclassing Animated Widget

//   - best used to create stand alone widgets to reduce the size of your build methods
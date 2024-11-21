import 'package:flutter/material.dart';

class UsingExplicitAnimations2 extends StatefulWidget {
  const UsingExplicitAnimations2({super.key});

  @override
  State<UsingExplicitAnimations2> createState() => _UsingExplicitAnimations2State();
}

class _UsingExplicitAnimations2State extends State<UsingExplicitAnimations2> with SingleTickerProviderStateMixin {
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
            child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
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
                          _controller.value
                        ]),
                      ),
                    ),
                  );
                }),
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

//!! TODO: review BeamClipper and Path clipping / CutsomPath's
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

// Custom Explicit Animations

//   - while there are many built-in animations you can use in Flutter
//     there may not be one to suite your needs for more intricate or complex animations

//   - to create your own custom explicit animations you can use the following widgets:

//       - AnimatedBuilder

//       - AnimatedWidget
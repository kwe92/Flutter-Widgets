import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  final int duration;
  final double size;
  const CountDownTimer({
    this.duration = 2,
    this.size = 305,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      home: ProgressIndicatorExample(duration: duration, size: size),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  final int duration;
  final double size;
  const ProgressIndicatorExample({
    required this.duration,
    required this.size,
    super.key,
  });

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: Duration(seconds: widget.duration),
    )..addListener(() {
        setState(() {});
      });

    // controller.repeat(reverse: true);
    controller.reverse(from: 1);
    // controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sideLength = widget.size;
    final double indicatorCircleSideLength = sideLength / 2 - 15;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://30dayfitness.app/static/eb7d2c345fbc0b90ae9d17f1444e67f7/shutterstock_1517608859.jpg',
                    ),
                    //  AssetImage('assets/high_knees.jpeg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: indicatorCircleSideLength,
                  height: indicatorCircleSideLength,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: indicatorCircleSideLength,
                    value: controller.value,
                    semanticsLabel: 'Circular progress indicator',
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: sideLength,
                  width: sideLength,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E3311).withOpacity(
                      0.0,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.25,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        sideLength / 2,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  (controller.value * widget.duration).toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 52,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

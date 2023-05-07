import 'package:flutter/material.dart';
import 'dart:math';

class CountDownTimerApp extends StatelessWidget {
  const CountDownTimerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const int duration = 30;
    const double size = 275;
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      home: const _CountDownTimer(
        duration: duration,
        size: size,
      ),
    );
  }
}

class _CountDownTimer extends StatefulWidget {
  final int duration;
  final double size;
  const _CountDownTimer({
    required this.duration,
    required this.size,
    super.key,
  });

  @override
  State<_CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<_CountDownTimer> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
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
    final double indicatorCircleSideLength = sideLength > 150 ? sideLength / 2 - 15 : sideLength / 2 - 10;

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
                    color: const Color.fromRGBO(32, 140, 255, 1),
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
                      width: 3.25,
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
                  style: TextStyle(
                    fontSize:
                        widget.size > 150 ? (sqrt(widget.size) * 6.250).ceil().toDouble() : (sqrt(widget.size) * 4.250).ceil().toDouble(),
                    fontWeight: FontWeight.w500,
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

import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xff6750a4),
      ),
      home: const ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

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
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    // controller.repeat(reverse: true);
    controller.reverse(from: 1);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double sideLength = 275;
    const double indicatorCircleSideLength = sideLength / 2 - 15;

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
                        'https://30dayfitness.app/static/eb7d2c345fbc0b90ae9d17f1444e67f7/shutterstock_1517608859.jpg'),
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        sideLength / 2,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  (controller.value * 20).toStringAsFixed(0),
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

import 'package:flutter/material.dart';

class SliderVerticalWidget extends StatefulWidget {
  const SliderVerticalWidget({super.key});

  @override
  State<SliderVerticalWidget> createState() => _SliderVerticalWidgetState();
}

class _SliderVerticalWidgetState extends State<SliderVerticalWidget> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            // margin: ,
            child: SliderTheme(
              data: const SliderThemeData(
                trackHeight: 72,
                trackShape: RectangularSliderTrackShape(),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
              ),
              child: RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  min: 0,
                  max: 100,
                  divisions: 20,
                  value: value,
                  onChanged: (val) => setState(() => value = val),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

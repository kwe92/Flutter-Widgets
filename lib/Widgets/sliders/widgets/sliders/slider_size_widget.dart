import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/colors/slider_colors.dart';

// TODO: add comments

class SliderSizeWidget extends StatefulWidget {
  const SliderSizeWidget({super.key});

  @override
  State<SliderSizeWidget> createState() => _SliderSizeWidgetState();
}

class _SliderSizeWidgetState extends State<SliderSizeWidget> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        // change slider height
        trackHeight: 16,
        // change ticks inbetween color
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        activeTrackColor: SliderColors.aqua0,
        inactiveTrackColor: SliderColors.aqua0.withOpacity(0.25),
        thumbColor: SliderColors.aqua0,
        valueIndicatorColor: SliderColors.aqua0,
        // change size of thumb | the circle you drag
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 20,
        ),
        // change size of tap overlay of the thumb | circular box shadow
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 40,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox changes slider width ONLY
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 20,
              label: value.round().toString(),
              onChanged: (value) => setState(
                () => this.value = value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Change Slider Size

//   - SizedBox Widget | width only
//   - Container Widget margin Property | width only

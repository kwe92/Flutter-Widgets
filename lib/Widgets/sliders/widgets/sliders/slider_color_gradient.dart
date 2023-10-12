import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/gradient_track_shape.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/line_tickmark_shape.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/rectangular_slider_value_indicator_shape.dart';

class SliderColorGradient extends StatefulWidget {
  final bool swap;
  const SliderColorGradient({
    this.swap = false,
    super.key,
  });

  @override
  State<SliderColorGradient> createState() => _SliderColorGradientState();
}

class _SliderColorGradientState extends State<SliderColorGradient> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 24.0,
        trackShape: GradientTrackShape(swap: widget.swap),
        activeTrackColor: Colors.purple,
        inactiveTrackColor: Colors.red,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
        thumbColor: Colors.white,
        tickMarkShape: const LineTickMarkShape(tickMarkRadius: 4),
        activeTickMarkColor: const Color.fromRGBO(255, 255, 255, 1),
        inactiveTickMarkColor: Colors.white,
        valueIndicatorShape: const CustomRectangularSliderValueIndicatorShape(),
        overlayColor: const Color(0XFF000000).withOpacity(0.25),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Slider(
            value: value,
            min: 0,
            max: 10,
            divisions: 10,
            label: value.toInt().toString(),
            onChanged: (value) => setState(
              () => this.value = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: !widget.swap
                        ? const Color(
                            0xff10883D,
                          )
                        : const Color(
                            0xff993218,
                          ),
                  ),
                ),
                Text(
                  '10',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: !widget.swap
                        ? const Color(
                            0xff993218,
                          )
                        : const Color(
                            0xff10883D,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/utils.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/gradient_track_shape.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/line_tickmark_shape.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/rectangular_slider_value_indicator_shape.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_color_gradient_model.dart';
import 'package:provider/provider.dart';

// TODO: Add Comments

class SliderColorGradient extends StatelessWidget {
  final bool swap;

  final double min;

  final double max;

  final int divisions;

  final bool showTopLabel;

  const SliderColorGradient({
    this.min = 0,
    this.max = 10,
    this.divisions = 10,
    this.swap = false,
    this.showTopLabel = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final SliderColorGradientModel model = context.watch<SliderColorGradientModel>();
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 24.0,
        trackShape: GradientTrackShape(swap: swap),
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                showTopLabel
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...Utils.modelBuilder(
                            List<String>.generate(
                              max.toInt() + 1,
                              (index) => (index++).toString(),
                            ),
                            Utils.labelBuilder(model.value, visible: false),
                          )
                        ],
                      )
                    : const SizedBox(),
                Slider(
                  value: model.value,
                  min: min,
                  max: max,
                  divisions: divisions,
                  label: model.value.toInt().toString(),
                  onChanged: (value) => model.setValue(value),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 11, right: 7, top: showTopLabel ? 21 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: !swap
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
                      color: !swap
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
      ),
    );
  }
}

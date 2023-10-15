import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/utils.dart';

// TODO: Add Comments

class SliderTop extends StatelessWidget {
  final List<String> labels;
  final double indexTop;
  final double min;
  final double max;
  final int divisions;
  final Function(double)? onChanged;
  final bool visibleLabel;

  const SliderTop({
    required this.labels,
    required this.indexTop,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
    this.visibleLabel = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Utils.modelBuilder(
                  labels,
                  Utils.labelBuilder(
                    indexTop,
                    visible: true,
                  )),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Slider(
              value: indexTop.toDouble(),
              min: min,
              max: max,
              divisions: divisions,
              label: visibleLabel ? labels[indexTop.toInt()] : null,
              onChanged: onChanged,
            ),
          ),
        ],
      );
}

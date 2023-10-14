import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_color_gradient.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_color_widget.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_label_widget.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_size_widget.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/tabbar_widget.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarWidget(
      title: 'Sliders',
      tabs: [
        Tab(
          icon: Icon(Icons.color_lens),
          text: "Colors",
        ),
        Tab(
          icon: Icon(Icons.photo_size_select_large),
          text: "Size",
        ),
        Tab(
          icon: Icon(Icons.text_fields),
          text: "Labels",
        ),
        Tab(
          icon: Icon(Icons.border_color),
          text: "Gradient",
        ),
      ],
      children: [
        SliderColorWidget(),
        SliderSizeWidget(),
        SliderLabelWidget(),
        SliderColorGradient(
          swap: false,
          showTopLabel: true,
        ),
      ],
    );
  }
}

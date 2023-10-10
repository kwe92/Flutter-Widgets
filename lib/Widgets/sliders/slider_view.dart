import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/slider_color_widget.dart';
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
        )
      ],
      children: [SliderColorWidget()],
    );
  }
}

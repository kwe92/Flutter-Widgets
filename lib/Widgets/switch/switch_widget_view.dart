import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_widgets/Widgets/switch/switch_widget_view_model.dart';
import 'package:provider/provider.dart';

class SwitchWidgetView extends StatelessWidget {
  const SwitchWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SwitchWidgetViewModel>();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xff061e45),
        appBar: AppBar(
          backgroundColor: const Color(0xff36454f),
          title: const Text(
            "Working With Switch Widget",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Center(
          child: FlutterSwitch(
            value: model.isToggled,
            toggleSize: 28,
            width: 52,
            height: 32,
            padding: 2,
            activeColor: const Color(0xff002254),
            onToggle: (bool value) {
              model.toggle(value);
            },
          ),
        ),
      ),
    );
  }
}

// FlutterSwitch | flutter_switch

//   - a package that allows you to create custom switchs
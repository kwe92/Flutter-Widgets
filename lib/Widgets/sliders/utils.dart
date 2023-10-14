import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/sliders/widgets/sliders/label_widget.dart';

// TODO: Add Comments

class Utils {
  Utils._();

  static List<Widget> modelBuilder<M>(List<M> models, Widget Function(int index, M model) builder) =>
      models.asMap().map<int, Widget>((index, model) => MapEntry(index, builder(index, model))).values.toList();

  static Widget Function(int index, String model) labelBuilder(
    double indexTop, {
    Color? selectedColor,
    Color? unselectedColor,
    double? labelWidth,
    bool visible = false,
  }) {
    return (index, label) {
      final Color selected = selectedColor ?? Colors.black;

      final Color unselected = unselectedColor ?? Colors.black.withOpacity(visible ? 0.25 : 0);

      final isSelected = index == indexTop;

      final Color color = isSelected ? selected : unselected;

      return LabelWidget(label: label, color: color, width: labelWidth ?? 30);
    };
  }
}
